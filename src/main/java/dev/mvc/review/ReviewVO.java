package dev.mvc.review;

public class ReviewVO {
    
    /*
     * rno INTEGER NOT NULL PRIMARY KEY,
     *  mno INTEGER NOT NULL,
     *   title VARCHAR(50) NOT
     * NULL, content VARCHAR(200) NOT NULL, 
     * rdate DATE NOT NULL, 
     * rtime DATE NOT NULL,
     *  score INTEGER NOT NULL,
     */
    
    @Override
    public String toString() {
        return "ReviewVO [reviewno=" + reviewno + ", rno=" + rno + ", mno=" + mno + ", title=" + title + ", content="
                + content + ", rdate=" + rdate + ", score=" + score + "]";
    }

    private int reviewno;
    
    private int rno;
    
    private int mno;
   
    private String title;
    
    private String content;
    
    private String rdate;
    
    
    private int score;
    
    public int getReviewno() {
        return reviewno;
    }

    public void setReviewno(int reviewno) {
        this.reviewno = reviewno;
    }
    

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }



    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
