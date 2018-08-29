package com.ztcf.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Xiaoliang implements Serializable {
    private  double xcount;

    private Date xname;

    private  int id ;

    public void setXcount(double xcount) {
        this.xcount = xcount;
    }

    public void setXname(Date xname) {

        this.xname = xname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getXcount() {
        return xcount;
    }
   // @JsonFormat(pattern="yyyy-MM-dd ")
    public Date getXname() {

        return xname;
    }

    public int getId() {
        return id;
    }

    public Xiaoliang(double xcount, Date xname, int id) {

        this.xcount = xcount;

        this.xname = xname;
        this.id = id;
    }

    @Override

    public String toString() {

        return "Xiaoliang{" +
                "xcount=" + xcount +
                ", xname='" + xname + '\'' +
                ", id=" + id +
                '}';
    }
}
