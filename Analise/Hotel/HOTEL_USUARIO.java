/* Generated by Together */

/**
 * @persistent
 * @rdbPhysicalName <{HOTEL_USUARIO}>
 * @rdbPhysicalPrimaryKeyName HOTEL_USUARIO_ID_PK 
 */
public class HOTEL_USUARIO {
    public HOTEL_USUARIO() {
    }

    /**
     * @rdbPhysicalName USUARIO
     * @rdbNotNull
     * @rdbSize 10
     * @rdbDigits 0
     * @rdbLogicalType VARCHAR
     * @rdbPrimaryKey 
     */
    private String USUARIO;

    /**
     * @rdbPhysicalName SENHA
     * @rdbNotNull
     * @rdbSize 10
     * @rdbDigits 0
     * @rdbLogicalType VARCHAR
     * @rdbPrimaryKey 
     */
    private String SENHA;

    /**
     * @rdbPhysicalName PRIVILEGIO
     * @rdbSize 1
     * @rdbDigits 0
     * @rdbLogicalType CHAR 
     */
    private String PRIVILEGIO;
}
