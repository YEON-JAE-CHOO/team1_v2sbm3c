package dev.mvc.restaurant;

public class RestaurantVO {
	private int RNO;
	private int RONO;
	private String NAME ="";
	private int CODE;
	private String ADDRESS1 = "";
	private String ADDRESS2 = "";
	private String EXPLANATION = "";
	private String TYPE = "";
	private int LEASTPRICE;
	private int DELIVERYTIP;
	private String CALL = "";
	private int SCORE;
	private int REVIEWCOUNT;
	private int RECOCNT;
	private int ORDERCNT;
	private int CATENO;
	

	public int getRNO() {
		return RNO;
	}
	public void setRNO(int rNO) {
		RNO = rNO;
	}
	public int getRONO() {
		return RONO;
	}
	public void setRONO(int rONO) {
		RONO = rONO;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getCODE() {
		return CODE;
	}
	public void setCODE(int cODE) {
		CODE = cODE;
	}
	public String getADDRESS1() {
		return ADDRESS1;
	}
	public void setADDRESS1(String aDDRESS1) {
		ADDRESS1 = aDDRESS1;
	}
	public String getADDRESS2() {
		return ADDRESS2;
	}
	public void setADDRESS2(String aDDRESS2) {
		ADDRESS2 = aDDRESS2;
	}
	public String getEXPLANATION() {
		return EXPLANATION;
	}
	public void setEXPLANATION(String eXPLANATION) {
		EXPLANATION = eXPLANATION;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public int getLEASTPRICE() {
		return LEASTPRICE;
	}
	public void setLEASTPRICE(int lEASTPRICE) {
		LEASTPRICE = lEASTPRICE;
	}
	public int getDELIVERYTIP() {
		return DELIVERYTIP;
	}
	public void setDELIVERYTIP(int dELIVERYTIP) {
		DELIVERYTIP = dELIVERYTIP;
	}
	public String getCALL() {
		return CALL;
	}
	public void setCALL(String cALL) {
		CALL = cALL;
	}
	public int getSCORE() {
		return SCORE;
	}
	public void setSCORE(int sCORE) {
		SCORE = sCORE;
	}
	public int getREVIEWCOUNT() {
		return REVIEWCOUNT;
	}
	public void setREVIEWCOUNT(int rEVIEWCOUNT) {
		REVIEWCOUNT = rEVIEWCOUNT;
	}
	public int getRECOCNT() {
		return RECOCNT;
	}
	public void setRECOCNT(int rECOCNT) {
		RECOCNT = rECOCNT;
	}
	public int getORDERCNT() {
		return ORDERCNT;
	}
	public void setORDERCNT(int oRDERCNT) {
		ORDERCNT = oRDERCNT;
	}
	public int getCATENO() {
		return CATENO;
	}
	public void setCATENO(int cATENO) {
		CATENO = cATENO;
	}

	@Override
	public String toString() {
		return "RestaurantVO [RNO=" + RNO + ", RONO=" + RONO + ", NAME=" + NAME + ", CODE=" + CODE + ", ADDRESS1="
				+ ADDRESS1 + ", ADDRESS2=" + ADDRESS2 + ", EXPLANATION=" + EXPLANATION + ", TYPE=" + TYPE
				+ ", LEASTPRICE=" + LEASTPRICE + ", DELIVERYTIP=" + DELIVERYTIP + ", CALL=" + CALL + ", SCORE=" + SCORE
				+ ", REVIEWCOUNT=" + REVIEWCOUNT + ", RECOCNT=" + RECOCNT + ", ORDERCNT=" + ORDERCNT + ", CATENO="
				+ CATENO + "]";
	}

}
