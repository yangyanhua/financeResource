package main.java.com.ztcf.entity;

public class Xiaoliang {
    private  int xcount;
    private  String xname;
    private  int id ;

    public void setXcount(int xcount) {
        this.xcount = xcount;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getXcount() {
        return xcount;
    }

    public String getXname() {
        return xname;
    }

    public int getId() {
        return id;
    }

    public void setXname(String xname) {
        this.xname = xname;
    }

    public Xiaoliang(int xcount, String xname, int id) {
        this.xcount = xcount;
        this.xname = xname;
        this.id = id;
    }
}
