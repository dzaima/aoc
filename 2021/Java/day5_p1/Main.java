import java.io.IOException;
import java.nio.file.*;
import java.util.*;
import java.util.function.*;

public class Main {
  public static final String DEFAULT_INPUT = "inputs/givenE6.in";
  public static final boolean LOG = false;
  
  public static void main(String[] args) {
    try {
      String[] lns = Files.readAllLines(Paths.get(args.length == 0? DEFAULT_INPUT : args[0])).toArray(new String[0]);
      run(lns);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  public static void run(String[] lnsR) {
    ArrayList<Line> lnsH = new ArrayList<>();
    ArrayList<Line> lnsV = new ArrayList<>();
    for (String ln : lnsR) {
      String[] parts = ln.split(",| -> ");
      Line l = new Line(Integer.parseInt(parts[0]), Integer.parseInt(parts[1]), Integer.parseInt(parts[2]), Integer.parseInt(parts[3]));
      if (l.h) lnsH.add(l);
      else if (l.v) lnsV.add(l);
    }
    HashSet<Integer> pointsR = new HashSet<>();
    for (Line l : lnsV) {
      pointsR.add(l.sx);
      pointsR.add(l.ex);
    }
    int[] points = new int[pointsR.size()];
    {
      int i = 0;
      for (Integer n : pointsR) points[i++] = n;
    }
    Arrays.sort(points);
    // System.out.println(Arrays.toString(points));
    
    int vlSi = 0; ArrayList<Line> vlS = new ArrayList<>(lnsV); vlS.sort(Comparator.comparing(c -> c.sy)); int vlSl = vlS.size(); // vertical line starts
    int vlEi = 0; ArrayList<Line> vlE = new ArrayList<>(lnsV); vlE.sort(Comparator.comparing(c -> c.ey)); int vlEl = vlE.size(); // vertical line ends
    int hli  = 0; ArrayList<Line> hl  = new ArrayList<>(lnsH); hl .sort(Main::hlComparator); int hll  = hl .size(); // horizontal lines
    BinTree vOne = new BinTree(points); // 0 or 1, if current cell has precisely 1 vertical line
    BinTree vMore = new BinTree(points); // 0 or 1, if current sell has >1 overlapping vertical lines
    BinTree vCount = new BinTree(points); // 0 if no lines present in this cell, otherwise, number of overlapping lines minus one
  
    BiFunction<Integer, Integer, Long> getCount = (s, e) -> {
      long nS = vOne.countLT(s);
      long nE = vOne.countLT(e);
      if (LOG) {
        StringBuilder a= new StringBuilder();
        StringBuilder b= new StringBuilder();
        StringBuilder c= new StringBuilder();
        for (int i = 0; i < 20; i++) {
          a.append(vOne.countLT(i+1));
          b.append(vMore.countLT(i+1));
          c.append(vCount.countLT(i+1));
        }
        log("      vOne   = "+a);
        log("      vMore  = "+b);
        log("      vCount = "+c);
        log("      count "+s+"-"+e+": "+nS+"-"+nE);
      }
      return nE-nS;
    };
    
    long result = 0;
    int cy = 0;
    int py = -1234567;
    while (true) {
      long lnResult = 0;
      int ny = Integer.MAX_VALUE;
      log("y = "+cy);
      
      // add overlapping vertical lines that have been skipped over
      {
        int dy = cy-py;
        long cc = vMore.root.sumCount;
        lnResult+= dy*cc;
        if (cc!=0 || py>=0) log("  "+cc+" vertical overlapping line(s) over "+dy+" line(s) = "+(dy*cc));
      }
      
      // add the newly started vertical lines to the trees
      while (vlSi<vlSl) {
        Line c = vlS.get(vlSi);
        if (c.sy>cy) {
          //noinspection ConstantConditions
          ny = Math.min(ny, c.sy);
          break;
        }
        assert c.sy==cy;
        log("  Starting vertical line "+c);
        BinTree.BNode nOne = vOne.find(c.sx);
        BinTree.BNode nCount = vCount.find(c.sx);
        if (nOne.myCount==0 && nCount.myCount==0) vOne.add(nOne, 1);
        else {
          if (nOne.myCount==1) {
            vOne.add(nOne, -1);
            vMore.add(vMore.find(c.sx), 1);
          }
          vCount.add(nCount, 1);
        }
        vlSi++;
      }
      
      // remove the completed vertical lines from the trees
      while (vlEi<vlEl) {
        Line c = vlE.get(vlEi);
        int y = c.ey+1;
        if (y>cy) {
          ny = Math.min(ny, y);
          break;
        }
        assert y==cy;
        log("  Ending vertical line "+c);
        BinTree.BNode nOne = vOne.find(c.sx);
        BinTree.BNode nCount = vCount.find(c.sx);
        if (nOne.myCount==1) vOne.add(nOne, -1);
        else if (vCount.add(nCount, -1)==0) {
          vOne.add(nOne, 1);
          vMore.add(vMore.find(c.sx), -1);
        }
        vlEi++;
      }
      
      // go through horizontal lines in-order
      {
        int pls = -1; // yet uncounted for segment of previous line
        int ple = -1;
        while (hli<hll) {
          Line c = hl.get(hli);
          if (c.sy>cy) {
            ny = Math.min(ny, c.sy);
            break;
          }
          int sx = c.sx;
          int ex = c.ex+1;
          log("  Horizontal line "+c+" / ["+sx+";"+ex+")");
          if (pls==-1) {
            pls = sx;
            ple = ex;
          } else {
            if (sx<pls) {
              sx = pls;
              ex = Math.max(sx,ex);
              log("    cutting off start");
            }
            log("    prev=["+pls+";"+ple+") c=["+sx+";"+ex+")");
            int fS = pls;
            int fE = Math.min(ple, sx);
            assert fS<=fE : sx+" "+ex+" "+pls+" "+ple;
            if (fS!=fE) {
              log("    finishing previous line ["+fS+";"+fE+")");
              lnResult+= getCount.apply(fS, fE);
            }
            
            if (sx < ple) {
              int oS = Math.max(pls, sx);
              int oE = Math.min(ple, ex);
              long mS = vMore.countLT(oS);
              long mE = vMore.countLT(oE);
              log("    Horizontal overlap on ["+oS+";"+oE+"), minus "+mE+"-"+mS);
              lnResult+= (oE-oS) - (mE-mS);
            }
  
            pls = sx>ple? sx : Math.min(ex, ple);
            ple = Math.max(ple, ex);
            log("    prev'=["+pls+";"+ple+")");
          }
          hli++;
        }
        if (pls!=-1) {
          log("    prev=["+pls+";"+ple+"), final");
          lnResult+= getCount.apply(pls, ple);
        }
      }
      
      
      
      log("y="+cy+" result: "+lnResult);
      result+= lnResult;
      if (ny == Integer.MAX_VALUE) break;
      py = cy;
      cy = ny;
    }
    
    System.out.println("Result: "+result);
  }
  
  private static int hlComparator(Line a, Line b) {
    assert a.sy==a.ey && b.sy==b.ey;
    int c;
    c = Integer.compare(a.sy, b.sy); if (c!=0) return c;
    c = Integer.compare(a.sx, b.sx); if (c!=0) return c;
    c = Integer.compare(a.ex, b.ex); return c;
  }
  
  
  public static void log(String msg) {
    if (LOG) System.out.println(msg);
  }
}

class Line {
  public final int sx, sy;
  public final int ex, ey;
  public final boolean h, v;
  
  Line(int sx, int sy, int ex, int ey) {
    h = sy==ey;
    v = !h && sx==ex;
    if (h & sx>ex) { int t=sx; sx=ex; ex=t; }
    if (v & sy>ey) { int t=sy; sy=ey; ey=t; }
    this.sx = sx;
    this.sy = sy;
    this.ex = ex;
    this.ey = ey;
  }
  
  public String toString() {
    return sx+","+sy+" -> "+ex+","+ey;
  }
}



class BinTree {
  public final BNode root;
  
  public BinTree(int[] points) {
    if (points.length>0) root = build(points, 0, points.length);
    else root = null;
  }
  
  private BNode build(int[] points, int s, int e) {
    if (s+1==e) return new BNode(points[s], null, null);
    if (s+2==e) {
      BNode l   = new BNode(points[s  ], null, null);
      BNode res = new BNode(points[s+1], l,    null);
      l.p = res;
      return res;
    }
    assert s<e;
    int m = (s+e)/2;
    BNode l = build(points, s, m);
    BNode r = build(points, m+1, e);
    BNode res = new BNode(points[m], l, r);
    l.p = res;
    r.p = res;
    return res;
  }
  
  public BNode findLeft(int v) { // find node for greatest point <= v
    BNode c = root;
    while (true) {
      if (c.l==null) {
        if (c.point<=v) return c;
        while (c.p!=null && c.p.l==c) c = c.p;
        return c.p;
      }
      if (v==c.point) return c;
      if (v<c.point) c = c.l;
      else           c = c.r;
    }
  }
  
  public int add(BNode n, int dcount) { // returns new myCount for the node
    n.myCount+= dcount;
    int ret = n.myCount;
    while (n!=null) {
      n.sumCount+= dcount;
      n = n.p;
    }
    return ret;
  }
  
  public long countLT(int point) {
    return countLT(root, point);
  }
  
  private long countLT(BNode c, int point) {
    if (point > c.point) {
      return (c.l==null? 0 : c.l.sumCount) + c.myCount + (c.r==null? 0 : countLT(c.r, point));
    } else if (point < c.point) {
      return c.l==null? 0 : countLT(c.l, point);
    } else { // point == c.point
      return c.l==null? 0 : c.l.sumCount;
    }
  }
  
  public BNode find(int point) {
    BNode r = findLeft(point);
    assert r.point == point : point;
    return r;
  }
  
  
  
  public static class BNode {
    public final int point;
    public int myCount = 0;
    public long sumCount = 0; // sum of counts of me + children
    public final BNode l, r; // r!=null => l!=null
    public BNode p;
    
    public BNode(int point, BNode l, BNode r) {
      this.point = point;
      this.l = l;
      this.r = r;
    }
  
    public String toString() {
      return point+":"+ sumCount +(l==null?"":"{"+l+(r==null?"":" "+r)+"}");
    }
  }
  
  public String toString() {
    return root.toString();
  }
}