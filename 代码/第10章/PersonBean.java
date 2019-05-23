package beans;
 	
/**
 * Class <code>PersonBean</code>.
 */
public class PersonBean implements java.io.Serializable {
    private String name;
    private boolean deceased;
 
    /** û�в����Ĺ��췽��. */
    public PersonBean() {
    }
 
    /**
     * ��ȡ����name��ֵ��ע�ⷽ����ΪgetName,������������ĸҪ��д.
     */
    public String getName() {
        return this.name;
    }
 
    /**
     * ��������name��ֵ��ע�ⷽ����ΪsetName��������������ĸҪ��д�������ɲα���*/
    public void setName(final String name) {
        this.name = name;
    }
 
    /**
     * ��ȡ���� "deceased"��ֵ
     * Different syntax for a boolean field (is vs. get)
     */
    public boolean isDeceased() {
        return this.deceased;
    }
 
    /**
     * ��������"deceased"��ֵ
     * @param deceased
     */
    public void setDeceased(final boolean deceased) {
        this.deceased = deceased;
    }
}
