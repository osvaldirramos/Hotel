/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the ODynaset and ODynasetMark classes
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
    			bug#	260389	GetFieldValue() should check its arguments
    					260789	All 'Chunk' code should check column type is a long 
    					260868	AppendChuknk shuld not accept NULL pointer
    					262112	Loop counter in DuplicateRecord should start from 0
    					271055	OEF/BOF return -1 on success
               			263418	GetFieldValue does not work with dates
*/

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

#ifndef _OracleInProcServer_H_
#include <oratlb.h>
#endif

static const IID IID_IOraDynaset =
{0xf0051a80, 0x00b3, 0x101b, { 0xad, 0xf2, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraStream =
{0x06beb9e0, 0xce61, 0x101b, { 0xb9, 0xd1, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };
static const IID IID_IOraMStream =
{0x08c70d00, 0xce61, 0x101b, { 0xb9, 0xd1, 0x04, 0x02, 0x1c, 0x00, 0x70, 0x02 } };

// ----- ODynaset -----------------------------------------------

ODynaset::ODynaset(void)
{
    m_sqlstmt = 0;  // no sql statement yet
}

ODynaset::ODynaset(const ODynaset &other)
{
    m_sqlstmt = 0;  // no sql statement yet
    Copy(other);
}

ODynaset::ODynaset(const ODatabase &odb, const char *sqlst, long options)
{
	 m_sqlstmt = 0;  // no sql statement yet
	 Open(odb, sqlst, options);
}

ODynaset::ODynaset(const ODatabase &odb, const char *sql_statement,
					unsigned int slicesize, unsigned int perblock,
					unsigned int blocks, unsigned int fetchlimit,
					unsigned int fetchsize, long options)
{
	 m_sqlstmt = 0;  // no sql statement yet
	 Open(odb, sql_statement, slicesize, perblock, blocks, fetchlimit, fetchsize, options);
}

ODynaset::~ODynaset(void) 
{
    Cleanup();
}

oresult ODynaset::Close(void)
{
    return(Cleanup());
}

oresult ODynaset::Open(const ODatabase &odb, const char *sqlst, long options)
{
	 if (!odb.IsOpen())
	 { // unopened database
		  SetInternalError(OERROR_INVPARENT);
		  return(OFAILURE);
    }
	 if (!sqlst)
	 {
		  SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
    }

	 odb.ErrorReset();
	IDispatch *dyni = ((_IOraDatabase *) (odb.Internal()))->get_CreateDynaset((char *) sqlst, options);

	return(OpenHelper(dyni, odb.Internal()));
}

oresult ODynaset::Open(const ODatabase &odb, const char *sql_statement,
					unsigned int slicesize, unsigned int perblock,
					unsigned int blocks, unsigned int fetchlimit,
					unsigned int fetchsize, long options)
{
	 if (!odb.IsOpen())
	 { // unopened database
		  SetInternalError(OERROR_INVPARENT);
		  return(OFAILURE);
    }
	 if (!sql_statement)
	 {
		  SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
    }

	 odb.ErrorReset();
	IDispatch *dyni = ((_IOraDatabase *) (odb.Internal()))->get_CreateCustomDynaset(
		(char *) sql_statement, slicesize, perblock, blocks, fetchlimit, fetchsize, options);

	return(OpenHelper(dyni, odb.Internal()));
}

ODynaset ODynaset::Clone(void) const
{
    ODynaset clonedyn;
    
    if (ActionGetStart(&clonedyn) != OSUCCESS)
        return(clonedyn); // returning unopened object - indicates error
    
    IDispatch *dyni = ((_IOraDynaset *) (Internal()))->get_Clone();
	
	oresult ores = clonedyn.OpenHelper(dyni, Internal());
	if (ores != OSUCCESS)
	    clonedyn.Close();  // make sure it isn't partly opened
	
	return(clonedyn);
}  

oresult ODynaset::OpenHelper(void *id, void *otheri)
{
	if (!id) 
    { // couldn't create dynaset - error is on other object
        SetOtherError(otheri);
        return(OFAILURE);
    }
	
    Cleanup();
        
	IDispatch *idisp = (IDispatch *) id;
	
	void *tempi;	
	HRESULT hc = idisp->QueryInterface(IID_IOraDynaset, &tempi);
	idisp->Release();
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
    
	return(SetObjectInterface(tempi));
}

OFieldCollection ODynaset::GetFields(void) const
{
    OFieldCollection fs;
    
    if (ActionGetStart(&fs) != OSUCCESS)
        return(fs); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraDynaset *) (Internal()))->get_Fields();

    fs.OpenHelper((void *) connect, Internal());
    
    return(fs);
}

OSession ODynaset::GetSession(void) const
{
    OSession sess;
    
    if (ActionGetStart(&sess) != OSUCCESS)
        return(sess); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraDynaset *) (Internal()))->get_Session();
	
	sess.OpenHelper((void *) connect, Internal());
	
	return(sess);
}

ODatabase ODynaset::GetDatabase(void) const
{
    ODatabase odb;
    
    if (ActionGetStart(&odb) != OSUCCESS)
        return(odb); // returning unopened object - indicates error
    
    IDispatch *db = ((_IOraDynaset *) (Internal()))->get_Database();
    
    odb.OpenHelper((void *) db, Internal());
    
    return(odb);
}

OField ODynaset::GetField(int index) const
{
    return(GetFields().GetField(index));
}
     
OField ODynaset::GetField(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
    { // bad index
        OField closedfield;
        closedfield.SetInternalError(OERROR_INVPARENT);
        return(closedfield);
    }
    
    return(GetFields().GetField(index));
}

OConnection ODynaset::GetConnection(void) const
{
    OConnection conn;
    
    if (ActionGetStart(&conn) != OSUCCESS)
        return(conn); // returning unopened object - indicates error
    
	IDispatch *connect = ((_IOraDynaset *) (Internal()))->get_Connection();
	
	conn.OpenHelper((void *) connect, Internal());
	
	return(conn);
}

ODynasetMark ODynaset::GetMark(void) const
{
    ODynasetMark mrk;
    
    if (ActionGetStart(&mrk) != OSUCCESS)
        return(mrk); // returning unopened object - indicates error
    
    void *obji = (void *) ((_IOraDynaset *) Internal())->get_Bookmark();
    mrk.OpenHelper(obji, Internal());
    
    return(mrk);    
}

ODynasetMark ODynaset::GetLastModifiedMark(void) const
{
    ODynasetMark mrk;
    
    if (ActionGetStart(&mrk) != OSUCCESS)
        return(mrk); // returning unopened object - indicates error
    
    void *obji = (void *) ((_IOraDynaset *) Internal())->get_LastModified();
    mrk.OpenHelper(obji, Internal());
    
    return(mrk);    
}

// overloaded assignment operator
ODynaset &ODynaset::operator=(const ODynaset &other)
{
    if (&other == this)
        return(*this); // self assignment - do nothing
    
    // clear out our old state
    if (OSUCCESS == Cleanup())
    {
        Copy(other); // call copy constructor
    }
    // if the cleanup failed (possible but unlikely) we don't do the copy
    //    and as a result, we pass on the unmodified (or partly cleaned!) object
    
    return(*this);
} 

oresult ODynaset::Copy(const ODynaset &other)
{
    // don't copy the sql statement
    m_sqlstmt = 0;
    
    return(OOracleObject::Copy(other));
}

oresult ODynaset::Cleanup(void)
{
    if (m_sqlstmt)
    {
        OObjectFreeString(m_sqlstmt);
        m_sqlstmt = 0;
    }
    
    return(OOracleObject::Cleanup());
}   

oresult ODynaset::Refresh(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->Refresh();  // fires refresh advisory
    if (ErrorNumber() == OERROR_NONE)
    {
        return(OSUCCESS);
    }
    else
        return(OFAILURE);    
}
    
oresult ODynaset::SetSQL(const char *sql_statement)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    if (!sql_statement)
    {
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    // this will invalidate our current sql statement
    if (m_sqlstmt)
    {
        OObjectFreeString(m_sqlstmt);
        m_sqlstmt = 0;
    }
    
    // we need to hand in a real BSTR
    BSTR tempcp = OObjectAllocString(sql_statement); 
    if (!tempcp)
    {
        SetInternalError(OERROR_MEMORY);
        return(OFAILURE);
    }
    ((_IOraDynaset *) Internal())->put_SQL(tempcp);
    
    if (ErrorNumber() == OERROR_NONE)
    { // success, might as well remember the sql statment
        m_sqlstmt = tempcp;  // now we don't need to free tempcp
        return(OSUCCESS);
    }
    else
    {
        OObjectFreeString(tempcp);
        return(OFAILURE);
    }    
}
    
const char *ODynaset::GetSQL(void) const
{
    if (ActionStart() != OSUCCESS)
        return(NULL);
    
    // we always refetch the SQL statement, just in case
    //   a copy of this ODynaset changed the underlying dynaset's
    //   SQL statement
    
    // we need a non-const version of "this" to change m_sqlstmt
    ODynaset *this2p = (ODynaset *) this;
    
    if (m_sqlstmt)
    {
        OObjectFreeString(m_sqlstmt);
        this2p->m_sqlstmt = 0;
    }
    
    this2p->m_sqlstmt = ((_IOraDynaset *) Internal())->get_SQL();
    
    return(m_sqlstmt);
}

oresult ODynaset::MoveFirst(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->MoveFirst();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MoveLast(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->MoveLast();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MoveNext(oboolean gopast)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (gopast)
        ((_IOraDynaset *) Internal())->MoveNext();
    else
    {
        ((_IOraDynaset *) Internal())->_moveNext();
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MovePrev(oboolean gopast)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (gopast)
        ((_IOraDynaset *) Internal())->MovePrevious();
    else
    {
        ((_IOraDynaset *) Internal())->_movePrev();
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MoveNextN(long rows, oboolean gopast)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (gopast)
		  ((_IOraDynaset *) Internal())->MoveNextn(rows);
    else
    {
		  ((_IOraDynaset *) Internal())->_moveNextn(rows);
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MovePrevN(long rows, oboolean gopast)
{
    if (ActionStart() != OSUCCESS)
		  return(OFAILURE);

    if (gopast)
		  ((_IOraDynaset *) Internal())->MovePreviousn(rows);
    else
    {
		  ((_IOraDynaset *) Internal())->_movePrevn(rows);
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MoveRel(long rows, oboolean gopast)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (gopast)
		  ((_IOraDynaset *) Internal())->MoveRel(rows);
    else
    {
		  ((_IOraDynaset *) Internal())->_moveRel(rows);
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MoveTo(long rownum, oboolean gopast)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (gopast)
		  ((_IOraDynaset *) Internal())->MoveTo(rownum);
    else
    {
		  ((_IOraDynaset *) Internal())->_moveTo(rownum);
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::MoveToMark(const ODynasetMark &odmark)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (!odmark.IsOpen())
    {
        SetInternalError(OERROR_INVBKMRK);
        return(OFAILURE);
    }
    const BSTR themark = ((const BSTR) (odmark.Internal())); // get the mark
    ((_IOraDynaset *) Internal())->put_Bookmark(themark);
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oboolean ODynaset::IsEOF(void) const
{
    if (ActionStart() != OSUCCESS)
        return(TRUE);
    
// BUG #271055 get_EOF returns -1 on success !!
    return(((_IOraDynaset *) Internal())->get_EOF() ? TRUE : FALSE);
}

oboolean ODynaset::IsBOF(void) const
{
    if (ActionStart() != OSUCCESS)
        return(TRUE);
    
// BUG #271055 get_BOF returns -1 on success !!
    return(((_IOraDynaset *) Internal())->get_BOF() ? TRUE : FALSE);
}

oboolean ODynaset::IsFirst(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);          
        
    return(((_IOraDynaset *) Internal())->get_IsFirst() ? TRUE : FALSE);
}

oboolean ODynaset::IsLast(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);

    int	test = ((_IOraDynaset *) Internal())->get_IsLast();    
    return(test ? TRUE : FALSE);
}

oboolean ODynaset::IsValidRecord(void) const
{
    // we tell if the current row is valid by trying to get a bookmark
    if (ActionStart() != OSUCCESS)
        return(FALSE);
    
    ODynasetMark tempmark = GetMark();
    // if that failed then an error will be set on bookmark (which goes away
    //    and on the dynaset
    
    return (tempmark.IsOpen());
}   

oboolean ODynaset::CanTransact(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);
    
    BOOL cantran = ((_IOraDynaset *) Internal())->get_Transactions();
	 return(cantran ? TRUE : FALSE);
}

oboolean ODynaset::CanUpdate(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);
    
    BOOL canup = ((_IOraDynaset *) Internal())->get_Updatable();
    return(canup ? TRUE : FALSE);    
}

oboolean ODynaset::CanRefresh(void) const
{
    // can always refresh if we're open
    return (IsOpen());
}

oboolean ODynaset::CanScroll(void) const
{
    // we can always scroll if we can mark
    return CanMark();
}

oboolean ODynaset::CanMark(void) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);
    
    BOOL canmark = ((_IOraDynaset *) Internal())->get_Bookmarkable();
    return(canmark ? TRUE : FALSE);    
}

long ODynaset::GetOptions(void) const
{
    if (ActionStart() != OSUCCESS)
        return(ODYNASET_DEFAULT);
    
    return(((_IOraDynaset *) Internal())->get_Options());    
}

int ODynaset::GetEditMode(void) const
{
    int editmode;
    
    if (ActionStart() != OSUCCESS)
        return(ODYNASET_EDIT_NOEDIT);
    
	 editmode = ((_IOraDynaset *) Internal())->get_EditMode();
    
    return(editmode); // values are ODYNASET_EDIT_*
}

oresult ODynaset::StartEdit(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->Edit();
    
    return((0 == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::CancelEdit(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->UpdateControls();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::Update(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->Update();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::AddNewRecord(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->AddNew();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

// special struct for DuplicateRecord
struct VarList
{
	 VARIANT  *val;
    VarList   *next;
};

oresult ODynaset::DuplicateRecord(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    if (!IsValidRecord())
    {
        SetInternalError(OERROR_INVRECORD);
        return(OFAILURE);
    }
    
    // first get all the values of the current record
    
    // start list of values
    VarList *vhead = new VarList;
    VarList *curr = vhead;
    
    short findex;
    int nfields = GetFieldCount();
//BUG #262112    
	 for (findex = 0; findex < nfields; findex++)
    {
        curr->val = new VARIANT;
        VariantInit(curr->val);
	    ((_IOraDynaset *) Internal())->_getFieldValue(curr->val, findex);
	    
	    if (findex < nfields - 1)
	    { // start next item
	        curr->next = new VarList;
	        curr = curr->next;
	    }
	    else
	    { // this is the last item
	        curr->next = 0;
	    }
    }
    
    // now add a new record
    ((_IOraDynaset *) Internal())->AddNew();                                       
    
    if (OERROR_NONE == ErrorNumber())
    { // we were able to add the new record.  Set field values
        findex = 0;
        curr = vhead;
		  while (curr)
        {
	        ((_IOraDynaset *) Internal())->_updateFieldValue(curr->val, findex++);
	        if (OERROR_NONE != ErrorNumber())
	            break;  // bail out on error
	        curr = curr->next;
        }
    }
    
    // now get rid of all of the values
    curr = vhead;
    VarList *nextp;
    while (curr)
    {
        nextp = curr->next;
        VariantClear(curr->val);
        delete curr->val;
        delete curr;
        curr = nextp;
    }
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::DeleteRecord(void)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    ((_IOraDynaset *) Internal())->Delete();
    
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

int ODynaset::GetFieldCount(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    return(((_IOraDynaset *) Internal())->_getFieldCount());
}    

long ODynaset::GetRecordCount(void) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    return(((_IOraDynaset *) Internal())->get_RecordCount());
}

int ODynaset::GetFieldIndex(const char *fieldname) const
{
    if (ActionStart() != OSUCCESS)
        return(-1);
    if (!fieldname)
    {
        SetInternalError(OERROR_BADARG);
        return(-1);
    }
    
    // pass in a real BSTR for fieldname (ARGHH)
    BSTR tempf = OObjectAllocString(fieldname);
    int index = ((_IOraDynaset *) Internal())->_getFieldIndex((char *) tempf);
    OObjectFreeString(tempf);
    
    return((0 == ErrorNumber()) ? index : -1);    
}

oboolean ODynaset::IsFieldTruncated(int index) const
{
    if (ActionStart() != OSUCCESS)
        return(FALSE);

    int ftype = GetFieldServerType(index);
//BUG #260789    
    if (ftype != OTYPE_LONG && ftype != OTYPE_LONGRAW)
    { // this field isn't a long
        SetInternalError(OERROR_BADARG);
        return(FALSE);
    }
    
    int istrunc = ((_IOraDynaset *) (Internal()))->_isFieldTruncated(index);
    return(istrunc ? TRUE : FALSE);  
}

oboolean ODynaset::IsFieldTruncated(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(FALSE);
    return(IsFieldTruncated(index));
}

short ODynaset::GetFieldServerType(int index) const
{
    if (ActionStart() != OSUCCESS)
		  return(0);
	
    return (short) (((_IOraDynaset *) (Internal()))->_getFieldServerType(index));
}

short ODynaset::GetFieldServerType(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(0);
    return (GetFieldServerType(index));
}

short ODynaset::GetFieldPrecision(int index) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
	
    return (short) (((_IOraDynaset *) (Internal()))->_getFieldPrecision(index));
}

short ODynaset::GetFieldPrecision(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
	 if (index < 0)
        return(0);
    return(GetFieldPrecision(index));
}

short ODynaset::GetFieldScale(int index) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
	
    return (short) (((_IOraDynaset *) (Internal()))->_getFieldScale(index));
}

short ODynaset::GetFieldScale(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(0);
    return(GetFieldScale(index));
}

long ODynaset::GetFieldSize(int index) const
{
    if (ActionStart() != OSUCCESS)
		  return(0);
	
    return(((_IOraDynaset *) (Internal()))->_getFieldSize(index));
}

long ODynaset::GetFieldSize(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(0);
    return(GetFieldSize(index));
}

long ODynaset::GetFieldServerSize(int index) const
{
    if (ActionStart() != OSUCCESS)
        return(0);
    
    return(((_IOraDynaset *) (Internal()))->_getFieldDataSize(index));
}

long ODynaset::GetFieldServerSize(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
	 if (index < 0)
        return(0);
    return(GetFieldServerSize(index));
}

oboolean ODynaset::IsFieldNullOK(int index) const
{
     if (ActionStart() != OSUCCESS)
        return(FALSE);
	
    int isok = ((_IOraDynaset *) (Internal()))->_isFieldNullOK(index);
    return(isok ? TRUE : FALSE);
}

oboolean ODynaset::IsFieldNullOK(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(0);
    return(IsFieldNullOK(index));
}

oboolean ODynaset::IsFieldUpdatable(int index) const
{
     if (ActionStart() != OSUCCESS)
        return(FALSE);
	
    int isok = ((_IOraDynaset *) (Internal()))->_isFieldUpdatable(index);
    return(isok ? TRUE : FALSE);
}

oboolean ODynaset::IsFieldUpdatable(const char *fieldname) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(0);
    return(IsFieldUpdatable(index));
}

oresult ODynaset::SetFieldUpdatable(int index, oboolean update) const
{
     if (ActionStart() != OSUCCESS)
        return(OFAILURE);
	
    ((_IOraDynaset *) (Internal()))->_setFieldUpdatable(index, update);
	return(OSUCCESS);
}

oresult ODynaset::SetFieldUpdatable(const char *fieldname, oboolean update) const
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);
    return(SetFieldUpdatable(index, update));
}

oresult ODynaset::GetFieldValue(int index, OValue *val) const
{                   
//BUG #260389
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
    {
	    val->Clear(); // clear it
        return(OFAILURE);
    }
	
	// get pointer to OOLEvar inside the OValue
	//   we then directly set the VARIANT in the OOLEvar - which sets the OValue
	OOLEvar *vres = (OOLEvar *) val->Internal();
	((_IOraDynaset *) Internal())->_getFieldValue(vres->GetVariant(), index);
	vres->HaveSetVariant();
	
    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::GetFieldValue(const char *fieldname, OValue *val) const
{
//BUG #260389
	if (! val || ! fieldname)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldValue(index, val));
}

oresult ODynaset::GetFieldValue(int index, int *val) const
{
//BUG #260389
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

	OOLEvar vres;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), index);
	vres.HaveSetVariant();
	
	return(vres.GetValue(val));
}

oresult ODynaset::GetFieldValue(const char *fieldname, int *val) const
{
//BUG #260389
	if (! val || ! fieldname)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldValue(index, val));
}

oresult ODynaset::GetFieldValue(int index, long *val) const
{
//BUG #260389
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

	OOLEvar vres;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), index);
	vres.HaveSetVariant();
	
	return(vres.GetValue(val));
}

oresult ODynaset::GetFieldValue(const char *fieldname, long *val) const
{
//BUG #260389
	if (! val || ! fieldname)
	{
        SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
    }
		
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldValue(index, val));
}

oresult ODynaset::GetFieldValue(int index, double *val) const
{
//BUG #260389
	if (! val)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

	OOLEvar vres;
	((_IOraDynaset *) Internal())->_getFieldValue(vres.GetVariant(), index);
	vres.HaveSetVariant();

	return(vres.GetValue(val));
}

oresult ODynaset::GetFieldValue(const char *fieldname, double *val) const
{
//BUG #260389
	if (! val || ! fieldname)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldValue(index, val));
}

oresult ODynaset::GetFieldValue(int index, char *val, unsigned short maxlen) const
{
//BUG #260389
    if (! val || maxlen < 1)
    {
		  SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    // we need to get the value and then copy the characters - up to the maximum length
    OValue oval;
    
    if (GetFieldValue(index, &oval) != OSUCCESS)
        return(OFAILURE);

// BUG #263418	GetFieldValue does not work with dates   
    // what is the length of the string?
    OOLEvar *vres = (OOLEvar *) oval.Internal();
    // Need to call the GetValue method just to convert the OOLEvar into a string.
    // This is required if the variant is a date, but not if it is a string already.
    // The overhead of doing this is no more than that of getting the variant type
    // and only calling for dates. Note that buf is just a pointer and will be set
    // point at the string, but it is never used.
    const char *buf;
    vres->GetValue (&buf);
    // now we can get the length
    unsigned int slen = vres->GetStringLength();
    if (slen > (unsigned int) maxlen-1)
        slen = maxlen-1; // -1 to leave space for null termination

    // copy string (DBCS problem)
    memcpy(val, (const char *) oval, slen);
    // null terminate
    val[slen] = '\0';
    
    return(OSUCCESS);
}

oresult ODynaset::GetFieldValue(const char *fieldname, char *val, unsigned short maxlen) const
{
//BUG #260389
	if (! val || ! fieldname || maxlen < 1)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldValue(index, val, maxlen));
}

oresult ODynaset::GetFieldValue(int index, void __huge *longval, long len, long *readlen) const
{
//BUG #260389
	if (! longval || len < 1 || ! readlen)
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
    {
        *readlen = 0;
        return(OFAILURE);
    }
    int ftype = GetFieldServerType(index);
//BUG #260789    
    if (ftype != OTYPE_LONG && ftype != OTYPE_LONGRAW)
    { // this field isn't a long (which we don't allow yet)
        *readlen = 0;
        SetInternalError(OERROR_BADTYPE);
        return(OFAILURE);
    }

    if (len < 1)
	 { // this field isn't a long, or negative length (which we don't allow yet)
        *readlen = 0;
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
    
    // fetch the long field value
	OOLEvar vres;
	((_IOraDynaset *) Internal())->_fetchLongFieldValue(vres.GetVariant(), index, len);
	vres.HaveSetVariant();
	
	if (vres.IsNull())
	{ // there was nothing in the field
	    *readlen = 0;
	    return(OSUCCESS);
	}
	
	// we've got something - try to get data from it
	VARIANT *varp = vres.GetVariant();
	if (V_VT(varp) != VT_UNKNOWN)
	{ // we don't have expected interface
	    SetInternalError(OERROR_SYSTEM);
	    return(OFAILURE);
	}

	// get the _IOraStream interface
	IUnknown *unkp = V_UNKNOWN(varp);
	void *istr;	
	HRESULT hc = unkp->QueryInterface(IID_IOraMStream, &istr);
	// unkp->Release(); don't release because VARIANT owns it
	if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
        return(OFAILURE);
    }
	
	// use the _IOraStream interface to copy the bytes
	// figure out how long the stream is
	long pos;
	((_IOraMStream *) istr)->Seek(0L, STREAM_SEEK_CUR, &pos);
	if (pos < len)
	{ // we weren't able to read as many bytes as asked for
	    len = pos; // adjust # of bytes we will try to read
	    /*
	        With 16bit OCI we will only be able to tell the length
	        of the long (before reading it all) if len < 64K.  So
	        if len >= 64K pos will always == len
	    */
	}
	
	// now seek to beginning
	((_IOraMStream *) istr)->Seek(0L, STREAM_SEEK_SET, &pos);
	
	// and read
	hc = ((_IOraMStream *) istr)->Read(longval, len, readlen);
	
	((_IOraMStream *) istr)->Release();
	if (FAILED(hc))
	{
	    SetInternalError(GetScode(hc));
	    return(OFAILURE);
	}	
	
	return(OSUCCESS);
}

oresult ODynaset::GetFieldValue(const char *fieldname, void __huge *longval, long len, long *readlen) const
{
//BUG #260389
	if (! longval || ! fieldname || ! readlen)
	{
        SetInternalError(OERROR_BADARG);
		  return(OFAILURE);
    }
		
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldValue(index, longval, len, readlen));
}

oresult ODynaset::GetFieldChunk(int index, void *chunkp, long offset, unsigned short len) const 
{
//	if (! chunkp || len < 1 || offset < 1)
	if (! chunkp || len < 1 || offset < 0)	// bug, cannot get first byte of chunk
	{
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }
		
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
	int fieldtype = GetFieldServerType (index);
//BUG #260789    
	if (fieldtype != OTYPE_LONG && fieldtype != OTYPE_LONGRAW)
	{
		SetInternalError (OERROR_BADTYPE);
		return(OFAILURE);
	}
	
	 BSTR tempp;
	 long	read;
	 HRESULT hc = ((_IOraDynaset *) Internal())->_getFieldChunk(&tempp, index, offset, len, &read);
    if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
    }

    if (ErrorNumber() != OERROR_NONE)
    {
        // clean up
        SysFreeString(tempp);
        return(OFAILURE);
    }
    else
    { // copy the string to the user's buffer
        memcpy((void *) chunkp, (const void *) tempp, len);
        
        // clean up
        SysFreeString(tempp);
        return(OSUCCESS);
	 }
}

oresult ODynaset::GetFieldChunk(const char *fieldname, void *chunkp, long offset, unsigned short len) const
{
	if (! fieldname)
	{   // Other bad arguments are handled by the overloaded GetFieldChunk called at end of routine
        SetInternalError(OERROR_BADARG);
        return(OFAILURE);
    }

    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(GetFieldChunk(index, chunkp, offset, len));
}

oresult ODynaset::SetFieldValue(int index, const void __huge *longval, long len)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
    
    // create the IOraStream interface
    _IOraMStream *istr;
	((_IOraDynaset *) Internal())->_createMStream(&istr);
    
    // now write the data to the stream
    long readlen;
    HRESULT hc = istr->Write((void *) longval, len, &readlen);
    if (FAILED(hc) || readlen != len)
    {
        istr->Release();
        SetInternalError(OERROR_MEMORY);
        return(OFAILURE);
    }
    
    // hand this to the field
    VARIANT val;
    VariantInit(&val);
    V_VT(&val) = VT_UNKNOWN;
    V_UNKNOWN(&val) = istr;
    
    ((_IOraDynaset *) Internal())->_updateFieldValue(&val, index);
    
    VariantClear(&val);  // releases stream
    
    return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE); 
}

oresult ODynaset::SetFieldValue(const char *fieldname, const void __huge *longval, long len)
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled
    return(SetFieldValue(index, longval, len));
}

//BUG #260868
oresult ODynaset::AppendFieldChunk(int index, const void *chunkp, unsigned short len)
{
	if (! chunkp || len < 1)
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);
        
	int fieldtype = GetFieldServerType (index);
//BUG #260789    
	if (fieldtype != OTYPE_LONG && fieldtype != OTYPE_LONGRAW)
	{   // This field is not a long
		SetInternalError (OERROR_BADTYPE);
		return(OFAILURE);
	}
	
	// create a tempbuffer with the data in it
	char *tempb = OObjectAllocStringLen((char *) chunkp, len);
	if (!tempb)
	{
	    SetInternalError(OERROR_MEMORY);
	    return(OFAILURE);
	}
	
    HRESULT hc = ((_IOraDynaset *) Internal())->_appendChunk(tempb, index);
    if (FAILED(hc))
    { // couldn't get the interface
        SetInternalError(OERROR_NOINTER);
    }

    OObjectFreeString(tempb);
    
    return((ErrorNumber() == OERROR_NONE) ? OSUCCESS : OFAILURE);
}

//BUG #260868
oresult ODynaset::AppendFieldChunk(const char *fieldname, const void *chunkp, unsigned short len)
{
	if (! fieldname)
	{
		SetInternalError (OERROR_BADARG);
		return(OFAILURE);
	}

    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling GetFieldValue so errors don't get muddled 
    
    return(AppendFieldChunk(index, chunkp, len));
}

oresult ODynaset::SetFieldValue(int index, const OValue &val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

    VARIANT *vres = ((OOLEvar *) (val.Internal()))->GetVariant();
    
    // set field value
	((_IOraDynaset *) Internal())->_updateFieldValue(vres, index);

    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::SetFieldValue(const char *fieldname, const OValue &val)
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling SetFieldValue so errors don't get muddled
    return(SetFieldValue(index, val));
}

oresult ODynaset::SetFieldValue(int index, int val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), index);

	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult ODynaset::SetFieldValue(const char *fieldname, int val)
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling SetFieldValue so errors don't get muddled
    return(SetFieldValue(index, val));
}

oresult ODynaset::SetFieldValue(int index, long val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), index);

    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::SetFieldValue(const char *fieldname, long val)
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling SetFieldValue so errors don't get muddled
    return(SetFieldValue(index, val));
}

oresult ODynaset::SetFieldValue(int index, double val)
{
	 if (ActionStart() != OSUCCESS)
		  return(OFAILURE);

	 // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), index);

    return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);    
}

oresult ODynaset::SetFieldValue(const char *fieldname, double val)
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling SetFieldValue so errors don't get muddled
    return(SetFieldValue(index, val));
}

oresult ODynaset::SetFieldValue(int index, const char *val)
{
    if (ActionStart() != OSUCCESS)
        return(OFAILURE);

    // set up VARIANT
    OOLEvar vres;
    vres.SetValue(val);
    
    // set field value
	((_IOraDynaset *) Internal())->_updateFieldValue(vres.GetVariant(), index);

	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult ODynaset::SetFieldValue(const char *fieldname, const char *val)
{
    int index = GetFieldIndex(fieldname);
    if (index < 0)
        return(OFAILURE);  // return without calling SetFieldValue so errors don't get muddled
    return(SetFieldValue(index, val));
}

oresult ODynaset::FindFirst(const char *sql)
{
	 if (ActionStart() != OSUCCESS)
		  return(OFAILURE);
	 ((_IOraDynaset *) Internal())->FindFirst((char *)sql);

	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult ODynaset::FindNext(const char *sql)
{
	 if (ActionStart() != OSUCCESS)
		  return(OFAILURE);
	 ((_IOraDynaset *) Internal())->FindNext((char *)sql);

	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult ODynaset::FindPrevious(const char *sql)
{
	 if (ActionStart() != OSUCCESS)
		  return(OFAILURE);
	 ((_IOraDynaset *) Internal())->FindPrevious((char *)sql);

	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oresult ODynaset::FindLast(const char *sql)
{
	 if (ActionStart() != OSUCCESS)
		  return(OFAILURE);
	 ((_IOraDynaset *) Internal())->FindLast((char *)sql);

	 return((OERROR_NONE == ErrorNumber()) ? OSUCCESS : OFAILURE);
}

oboolean ODynaset::NoMatch(void)
{
	 if (! IsOpen())
		  return(TRUE);

	 return ( ((_IOraDynaset *) Internal())->get_NoMatch() ? TRUE : FALSE);
}

unsigned int ODynaset::GetCacheSliceSize (void)
{
	return IsOpen() ? ((_IOraDynaset *) Internal())->get_CacheSliceSize() : 0;
}

unsigned int ODynaset::GetCacheSlicePerBlock (void)
{
	return IsOpen() ? ((_IOraDynaset *) Internal())->get_CacheSlicePerBlock() : 0;
}

unsigned int ODynaset::GetCacheBlocks (void)
{
	return IsOpen() ? ((_IOraDynaset *) Internal())->get_CacheBlocks() : 0;
}

unsigned int ODynaset::GetFetchLimit (void)
{
	return IsOpen() ? ((_IOraDynaset *) Internal())->get_FetchLimit() : 0;
}

unsigned int ODynaset::GetFetchSize (void)
{
	return IsOpen() ? ((_IOraDynaset *) Internal())->get_FetchSize() : 0;
}

void ODynaset::SetCacheSliceSize (unsigned int slice)
{
	if (IsOpen())
		((_IOraDynaset *) Internal())->put_CacheSliceSize(slice);
}

void ODynaset::SetCacheSlicePerBlock (unsigned int perblock)
{
	if (IsOpen())
		((_IOraDynaset *) Internal())->put_CacheSliceSize(perblock);
}

void ODynaset::SetCacheBlocks (unsigned int blocks)
{
	if (IsOpen())
		((_IOraDynaset *) Internal())->put_CacheBlocks(blocks);
}

void ODynaset::SetFetchLimit (unsigned int flimit)
{
	if (IsOpen())
		((_IOraDynaset *) Internal())->put_FetchLimit(flimit);
}

void ODynaset::SetFetchSize (unsigned int fsize)
{
	if (IsOpen())
		((_IOraDynaset *) Internal())->put_FetchSize(fsize);
}

oboolean ODynaset::IsCacheChanged(void)
{
	 return IsOpen() ? (((_IOraDynaset *) Internal())->get_CacheChanged() ? TRUE : FALSE) : FALSE;
}


// ----- ODynasetMark -----------------------------------------------

ODynasetMark::ODynasetMark(void)
{
    m_markdata = 0;  // nothing marked yet
} 

ODynasetMark::ODynasetMark(const ODynasetMark &other)
{
    if (other.m_markdata)
        m_markdata = OObjectAllocStringLen(other.m_markdata, OObjectStringLen(other.m_markdata));
    else
        m_markdata = 0;
}

ODynasetMark::~ODynasetMark(void)
{
    Cleanup();
}

char *ODynasetMark::Internal(void) const
{
    return m_markdata;
}

oboolean ODynasetMark::IsOpen(void) const
{
    return (m_markdata ? TRUE : FALSE);
}

ODynasetMark &ODynasetMark::operator=(const ODynasetMark &other)
{
    if (&other == this)
        return(*this);  // self reference
     
    Cleanup();  // drop current data
    
    if (other.m_markdata)
        m_markdata = OObjectAllocStringLen(other.m_markdata, OObjectStringLen(other.m_markdata));
    else
        m_markdata = 0;
    
    return(*this);
}

int ODynasetMark::operator==(const ODynasetMark &other) const
{
    // closed marks never equal anything
    if (!m_markdata || ! other.m_markdata)
        return(0);
    
    // just do a bytewise comparison of the mark data
    // markdata is a BSTR - compare for its full length (even over null bytes)
    unsigned int marklen = OObjectStringLen(m_markdata);
    
    if (0 == memcmp(m_markdata, other.m_markdata, marklen))
        return(1); // complete match
    else
        return(0); // not equal
}

int ODynasetMark::operator!=(const ODynasetMark &other) const
{
    return(!(this->operator==(other)));
}

oresult ODynasetMark::Close(void)
{
    return(Cleanup());
}

oresult ODynasetMark::Cleanup(void)
{
    if (m_markdata)
        OObjectFreeString(m_markdata);
    
    m_markdata = 0;
    
    return(OSUCCESS);
}

oresult ODynasetMark::OpenHelper(void *obji, void *otheri)
{
    Cleanup();
    if (!obji)
    {
        SetOtherError(otheri);
        return(OFAILURE);
    }
    
    // otherwise everything is fine
    m_markdata = (char *) obji;
    ErrorReset();
    
    return(OSUCCESS);   
}


