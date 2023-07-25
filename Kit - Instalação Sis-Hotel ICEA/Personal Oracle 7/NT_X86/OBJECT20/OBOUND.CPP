/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements the OBinder and OBound classes
                           
    CREATED    ********   11/22/94
    RWOOLARD	MODIFIED	03/20/95
                bug#	262162	IsChanged() not correct following Refresh()
                		266266	m_fieldname being initialized to 0
                		266270	BindToBinder(NULL, "ename") causes GPF 
                		266277	BindToBinder(&bind, NULL) returns success
                		267021	UnBindObj(NULL, TRUE) causes GPF
*/

#ifndef OBOUND_ORACLE
#include "OBound.h"
#endif

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

// ----- OBinderAdvise -----------------------------------------------
// this is a helper for OBinder

class OBinderAdvise : public OAdvise
{
public:
    OBinderAdvise(OBinder *parent = NULL) {m_binder = parent;}
    
    // on requests and notifys call trigger routines in OBinder and OBound
    oboolean ActionRequest(int movekind);
    void    ActionNotify(int movekind);
    
private:
    OBinder *m_binder;
       
};

// ----- OBound -----------------------------------------------

OBound::OBound(void)
{
// BUG #266266
    m_fieldname = OObjectAllocString ("");
    m_changed = FALSE;
    m_binder = 0;
    m_fieldindex = -1;  // invalid index
}

OBound::~OBound(void)
{
    if (m_fieldname)
        OObjectFreeString(m_fieldname);
    
    // make sure our binder knows we're gone
    if (m_binder)
        m_binder->UnbindObj(this, TRUE);
}

oresult OBound::Unbind(void)
{ 
    if (m_binder)
    {
        oresult ores = m_binder->UnbindObj(this, FALSE);
        if (ores == OSUCCESS)
        {
            m_binder = 0;
            return(OSUCCESS);
        }
        else
            return(OFAILURE);
    }
    else    
        return(OSUCCESS); // already unbound
}

oresult OBound::GetValue(OValue *val)
{
    if (m_binder)
        return(m_binder->GetFieldValue(m_fieldindex, val));
    else
        return(OFAILURE);
}

oresult OBound::SetValue(const OValue &val)
{
    if (m_binder)
        return(m_binder->SetFieldValue(m_fieldindex, val));
    else
        return(OFAILURE);
}

const char *OBound::GetName(void) const
{
    return(m_fieldname);  // this is NULL if we haven't done BindToBinder yet
}

ODatabase OBound::GetDatabase(void) const
{
    if (m_binder)
        return(m_binder->GetDatabase());
    else
    { // return closed database
        ODatabase odb;
        return(odb);
    }
}

ODynaset OBound::GetDynaset(void) const
{
    if (m_binder)
        return(m_binder->GetDynaset());
    else
    { // return closed dynaset
        ODynaset dyn;
        return(dyn);
    }
}
    
oresult OBound::GetFieldIndex(void)
{
    if (m_binder)
        return(m_binder->GetFieldIndex(&m_fieldindex, m_fieldname));
    else
        return(OFAILURE);
}

oresult OBound::BindToBinder(OBinder *binder, const char *fieldname)
{   
// BUG #266270 and 266277
	if (!binder || !fieldname)
	{
		// Set error here when error handling code is available
        return(OFAILURE);
	}
		
    if (m_binder)
    { // we're already bound - try to unbind
        if (m_binder->UnbindObj(this, FALSE) != OSUCCESS)
            return(OFAILURE);
        m_binder = 0;
    }
    
    // remember field name
    if (m_fieldname)
        OObjectFreeString(m_fieldname);
    m_fieldname = OObjectAllocString(fieldname);
    
    // remember containing binder
    m_binder = binder;
    
    return(m_binder->AddObjectToOBinder(this));
}

oresult OBound::SaveChangeBound(void)
{
    if (!m_changed)
        return(OSUCCESS);  // don't even call subclass
    
    return(SaveChange());  // do the real work
}

oresult OBound::RefreshBound(void)
{
    if (!m_binder || m_fieldindex < 0)
        return(OFAILURE);  // can't get the value
    
    // get the new data
    OValue val;
    m_binder->GetFieldValue(m_fieldindex,&val);
    
    // call subclass to do the work
    oresult ores = Refresh(val);
    
    if (ores == OSUCCESS)
        m_changed = FALSE;  // new value means we haven't got any changes
    
    return(ores);
}

oresult OBound::Changed(oboolean changed) 
{
    if ((changed && m_changed) || (!changed && !m_changed))
        return(OSUCCESS);  // we already know this
    
    if (changed && m_binder)
    { // try to start change in dynaset (will do a StartEdit, which may fail)
	    if (m_binder->Changed(TRUE) != OSUCCESS)
	        return(OFAILURE);
	}
    
    m_changed = changed;  // remember changed-ness
	    
	return(OSUCCESS);
} 

oboolean OBound::IsChanged(void) const
{
    return(m_changed);
}

oresult OBound::UnbindNotify(void)
{
    // the binder is letting go of us
    m_binder = 0;
    
    return(OSUCCESS);
}

oresult OBound::ClearChange(void)
{
    // the binder is telling us that the change has been saved
    Changed(FALSE);
    return(OSUCCESS);
}
 
// default trigger implementations
oresult OBound::Startup(void)
{return OSUCCESS;}

oresult OBound::Shutdown(void)
{return OSUCCESS;}

oresult OBound::PreQuery(void)
{return OSUCCESS;}

oresult OBound::PostQuery(void)
{return RefreshBound();}

oresult OBound::PreDelete(void)
{return OSUCCESS;}

oresult OBound::PostDelete(void)
{return OSUCCESS;}

oresult OBound::PreAdd(void)
{return OSUCCESS;}

oresult OBound::PostAdd(void)
{return RefreshBound();}

oresult OBound::PreUpdate(void)
{return OSUCCESS;}

oresult OBound::PostUpdate(void)
{return OSUCCESS;}

oresult OBound::PreRollback(void)
{return OSUCCESS;}

oresult OBound::PostRollback(void)
{return RefreshBound();}

oresult OBound::PreMove(void)
{return OSUCCESS;}

oresult OBound::PostMove(void)
{return RefreshBound();}

// ----- OBinder -----------------------------------------------

// # of OBound pointers in each chunk
#define OBinder_NBOUND 30

OBinder::OBinder(void)
{
    m_boundlist = 0;
    m_advise = 0;
   
    m_changed = FALSE;
    m_nbound = 0;   // # of bound objects

    m_schangeerr = 0;
    m_changeerr = OERROR_NONE;
}

OBinder::~OBinder(void)
{
    Close(FALSE);  // close, but don't fire shutdown triggers
}

oresult OBinder::Close(oboolean doShutdown)
{
    if (doShutdown)
    {  // fire shutdown triggers
        if (OSUCCESS != Shutdown())
            return(OFAILURE);
        if (OSUCCESS != DoAllObjects(OBound::Shutdown))
            return(OFAILURE);
    }
    
    // tell all bound objects that they aren't bound anymore
    DoAllObjects(OBound::UnbindNotify);
    
    // clean up the binder object
    
    // get rid of advisory sink
    delete (OBinderAdvise *) m_advise;
    m_advise = 0;
    
    // delete the list of bound objects
    //  note that we are only deleting our pointers.  We don't delete the objects
    OBound **curchunk;
    OBound **nextchunk;
    
    curchunk = m_boundlist;
    while (curchunk)
    {
        nextchunk = (OBound **) *(curchunk+(OBinder_NBOUND-1));
        delete [] curchunk;
        curchunk = nextchunk;
    }
    m_boundlist = 0;
    m_nbound = 0;
    m_changed = FALSE;
    
    return(OSUCCESS);      
}

// routine to have all bound objects refresh their values
oresult OBinder::Refresh(void)
{
    oresult ores = DoAllObjects(&OBound::RefreshBound);
//BUG #262162    
    if (ores == OSUCCESS)
    	m_changed = FALSE;
    return ores;
}

// routine called by bound object to get its field index
oresult OBinder::GetFieldIndex(int *ofldi, const char *fieldname)
{
    // get field index
    *ofldi = m_dynaset.GetFieldIndex(fieldname);
    return(*ofldi >= 0 ? OSUCCESS : OFAILURE);   
}

oresult OBinder::AddObjectToOBinder(OBound *object)
{
    /*
        We keep pointers to the bound objects in a linked list
        of chunks of pointers.  Each chunk contains OBinder_NBOUND-1 pointers
        and a pointer to the next chunk.  This is a "fat" linked list.
    */
    
    int ii;
    OBound **op;
    
    if (!m_boundlist)
    { // start the binder
        
        // allocate first chunk of bound object list
        m_boundlist = new OBound *[OBinder_NBOUND];
        if (!m_boundlist)
            return(OFAILURE);  // no memory!
        
        // make sure all the pointers are 0
        for (ii=0, op=m_boundlist; ii<OBinder_NBOUND; ii++, op++)
            *op = 0;          

        // call the startup trigger
        if (Startup() != OSUCCESS)
            return(OFAILURE);       
    }
    
    // scan through list to find all the objects.  We want to place ours after
    //   all the already bound objects
    op = m_boundlist;
    int nfound = 0;
    while(1)
    {
        for (ii=0; ii<OBinder_NBOUND-1; ii++, op++)
        {
            if (*op)
                nfound++;
            else if (nfound >= m_nbound)
                break;  // found a zero pointer after all set pointers
        }
        
        if (ii < OBinder_NBOUND-1)
            break; // we found a spot
        
        // go to the next chunk
        if (!*op)
        { // next chunk isn't allocated yet - do it
            *op = (OBound *) new OBound *[OBinder_NBOUND];
            OBound **op2;
            for (ii=0, op2 = (OBound **) (*op); ii<OBinder_NBOUND; ii++, op2++)
                *op2 = 0;  // make sure all the pointers are zeroed
        }
        
        op = (OBound **) (*op); // point at beginning of next chunk
    }
    
    // now op is pointing at an open spot
    *op = object; 
    m_nbound++;
    
    oresult ores = OSUCCESS;
    if (m_dynaset.IsOpen())
    {
        ores = object->GetFieldIndex();  // have object get its field index
        object->Startup();   // fire startup trigger for object
        /*
         * This line was commented out of the original code, but I think it should be
         * there to give the value to an object that is being bound to an alraedy open dynaset.
         * Suspect this line of code if OBinder starts to fail mysteriously
         */
        // object->RefreshBound();   // give the object its value
    }
    else
        object->Startup();  // just fire startup trigger
    
    return (ores);    
}

oresult OBinder::Open(const char *dbname, const char *username, const char *pwd, const char *sqls, long dynoptions)
{
    // open the database with the given arguments
    oresult ores = m_database.Open(dbname, username, pwd);
    
    // and call the database version of the open method
    if (ores == OSUCCESS)
        ores = Open(m_database, sqls, dynoptions);
    
    return(ores);   
}

oresult OBinder::Open(const ODatabase &odb, const char *sqls, long dynoptions)
{
    if (m_dynaset.IsOpen())
    { // open on old database - close it
        delete (OBinderAdvise *) m_advise;  // get rid of invalid advisory
        m_advise = 0;
        if (m_dynaset.Close() != OSUCCESS)
            return(OFAILURE);
    }
    
    // copy the database
    m_database = odb;
    if (!m_database.IsOpen())
        return(OFAILURE);  // not a whole lot we can do
    
    if (!sqls)
    { // caller hasn't specified a sql statement - we won't do a query
        return(OSUCCESS);
    }
    
    // call pre-action triggers
    if (PreQuery() != OSUCCESS)
        return(OFAILURE);
    if (DoAllObjects(&OBound::PreQuery) != OSUCCESS)
        return(OFAILURE);
    
    // create new dynaset and advice sink

    // open dynaset and move to first record
    if (m_dynaset.Open(odb, sqls, dynoptions) != OSUCCESS)
        return(OFAILURE); // couldn't open dynaset
    
    m_advise = (void *) new OBinderAdvise(this);
    if (OSUCCESS != ((OBinderAdvise *) m_advise)->Open(m_dynaset))
        return(OFAILURE);  // couldn't attach advisory
    
    // have all the bound objects get their field indices
    DoAllObjects(&OBound::GetFieldIndex);        
    
    // post action triggers
    if (PostQuery() != OSUCCESS)
        return(OFAILURE);
    if (DoAllObjects(&OBound::PostQuery) != OSUCCESS)   // by default, refreshes
        return(OFAILURE);
    
    return(OSUCCESS);
}

// navigational methods
oresult OBinder::MoveFirst(void)
{
    return(m_dynaset.MoveFirst());
}

oresult OBinder::MoveLast(void)
{
    return(m_dynaset.MoveLast());
}

oresult OBinder::MoveNext(void)
{
    return(m_dynaset.MoveNext(FALSE));  // bounded move
}

oresult OBinder::MovePrev(void)
{
    return(m_dynaset.MovePrev(FALSE));  // bounded move
}

oresult OBinder::MoveToMark(const ODynasetMark &mark)
{
    return(m_dynaset.MoveToMark(mark));
}

//BUG #262553
oboolean OBinder::CanMark(void) const 
{
	return m_dynaset.CanMark();
}

ODynasetMark OBinder::GetMark(void) const 
{
	return m_dynaset.GetMark();
}  // bookmark at current position

ODynasetMark OBinder::GetLastModifiedMark(void) const 
{
	return m_dynaset.GetLastModifiedMark();	// get bookmark at last modified record
}

// set SQL for the next query
oresult OBinder::SetSQL(const char *sqls)
{
    if (!m_dynaset.IsOpen())
    { // really open now that we have sql statement
        return(Open(m_database, sqls));
    }
    else
        return(m_dynaset.SetSQL(sqls));
}

//BUG #262553
const char * OBinder::GetSQL(void) const
{
	return m_dynaset.GetSQL();
}  // gets sql statement

oresult OBinder::RefreshQuery(void)
{
    if (!m_dynaset.IsOpen())
        return(OFAILURE);
    return(m_dynaset.Refresh());
    
    // triggers fired in advisory
}

const ODynaset OBinder::GetDynaset(void) const
{
    return(m_dynaset);
}

const ODatabase OBinder::GetDatabase(void) const
{
    return(m_database);
}

oboolean OBinder::IsChanged(void) const
{
    return m_changed;
}

//BUG #262553
oboolean OBinder::IsOpen(void) 
{
	return m_dynaset.IsOpen();
}

oresult OBinder::GetFieldValue(int index, OValue *val) const
{
    return(m_dynaset.GetFieldValue(index, val));
}

oresult OBinder::SetFieldValue(int index, const OValue &val)
{
    return(m_dynaset.SetFieldValue(index, val));
}

oresult OBinder::DeleteRecord(void)
{
    if (!m_dynaset.IsOpen())
        return(OFAILURE);  // can't delete record - no dynaset
    
    // delete the record
    m_dynaset.DeleteRecord();
    
    // now move off the deleted record
    m_dynaset.MoveNext();  // just to get off deleted record
    if (m_dynaset.IsEOF())
    { // whoops - we moved past last.  Backup
        m_dynaset.MovePrev();
        // if we've deleted the last record we're now on an invalid record
    }
    
    return(OSUCCESS);
}

oresult OBinder::AddNewRecord(void)
{
    if (!m_dynaset.IsOpen())
        return(OFAILURE);
   
    if (m_dynaset.AddNewRecord() != OSUCCESS)
        return(OFAILURE);
    
    // now call postadd triggers       
    if (PostAdd() != OSUCCESS)
        return(OFAILURE);
    if (DoAllObjects(OBound::PostAdd) != OSUCCESS)
        return(OFAILURE);
    
    return(OSUCCESS);
}

oresult OBinder::DuplicateRecord(void)
{
    if (!m_dynaset.IsOpen())
        return(OFAILURE);
   
    if (m_dynaset.DuplicateRecord() != OSUCCESS)
        return(OFAILURE);
    
    // now call postadd triggers       
    if (PostAdd() != OSUCCESS)
        return(OFAILURE);
    if (DoAllObjects(OBound::PostAdd) != OSUCCESS)
        return(OFAILURE);
    
    return(OSUCCESS);
}

oresult OBinder::Changed(oboolean cflag)
{
    // clear the change error state
    m_schangeerr = 0;
    m_changeerr = OERROR_NONE;
    
    if (cflag && m_changed || !cflag && !m_changed)
        return(OSUCCESS);  // no change from current state
    
    if (cflag && (m_dynaset.GetEditMode() == ODYNASET_EDIT_NOEDIT))
    { // we're starting a change
        if (m_dynaset.StartEdit() != OSUCCESS)
        {
            OnChangedError();
            return(OFAILURE);  // we can't start the edit, for some reason
        }
    }
    
    m_changed = cflag;
    
    return(OSUCCESS);     
}

void OBinder::OnChangedError(void)
{
    // remember the error we have
    m_changeerr = m_dynaset.ErrorNumber();
    m_schangeerr = m_dynaset.GetSession().ServerErrorNumber();
    
    return;
}

oboolean OBinder::GetChangedError(long *serr, long *cerr) const
{
    if (serr)
        *serr = m_schangeerr;
    if (cerr)
        *cerr = m_changeerr;
    
    return(m_schangeerr != 0 || m_changeerr != OERROR_NONE);
}

// public way to save changes
oresult OBinder::Update(void)
{
    return(SaveRecordChanges());
}

// the way we throw away changes to the current record
oresult OBinder::DiscardChanges(void)
{
    if (!IsChanged())
        return(OSUCCESS);  // nothing to do 
    
    m_changed = FALSE;
    
    // we have done a StartEdit, but we haven't changed any field values yet
    // so cancel the edit
    if (m_dynaset.CancelEdit() != OSUCCESS)
        return(OFAILURE);
    
    // tell all the bound objects to refresh
    return(Refresh());
}

oresult OBinder::DoAllObjects(oresult (OBound::*ff)(void))
{
    // just go through the list of objects and refresh them all
    OBound **op = m_boundlist;
    int      ii;
    int      ndone = 0;
    
    while (op && ndone < m_nbound)
    { // for all chunks
        for (ii=0; ii<OBinder_NBOUND-1; ii++, op++)
        { // for every pointer in this chunk
            if (*op)
            {
                if ((**op.*ff)() != OSUCCESS)
                    return(OFAILURE);
                ndone++;
                if (ndone >= m_nbound)
                    break;  // note that this makes op calculation below into nonsense
            }
        }
        
        // move to the next chunk
        op = (OBound **) (*op); // point at beginning of next chunk
    }
    
    return(OSUCCESS); 
}

oresult OBinder::UnbindObj(OBound *object, oboolean nofail)
{   
//BUG #267021	
	if (! object)
	{
        // Set error here when error handling code is available
        return(OFAILURE);
    }

    // just go through the list of objects and find the object to be unbound
    OBound **op = m_boundlist;
    int      ii;
    
    while (op)
    { // for all chunks
        for (ii=0; ii<OBinder_NBOUND-1; ii++, op++)
        { // for every pointer in this chunk
            if (*op == object)
            {
                if (OSUCCESS != (*op)->Shutdown() && !nofail)
                    return(OFAILURE);  // object doesn't want to go away
                (*op)->UnbindNotify();  // tell object it isn't bound anymore
                *op = 0;  // we don't free the object, just clear our pointer to it
                m_nbound--;
                break;
            }
            // note that we never free any memory - we keep all the chunks
        }
        
        if (ii < OBinder_NBOUND-1)
            break;  // we found the object
        
        // move to the next chunk
        op = (OBound **) (*op); // point at beginning of next chunk
    }
    
    return(OSUCCESS); 
}

// private way to save changes
oresult OBinder::SaveRecordChanges(void)
{
    // if there have been changes, save them
    if (m_changed && m_dynaset.IsOpen())
    { // save the change before we move
        if (DoAllObjects(&OBound::SaveChangeBound) != OSUCCESS)        
            return(OFAILURE);  // somebody didn't want to change
        
        if (m_dynaset.Update() != OSUCCESS) // as side effect, fires the update triggers
        { 
            return(OFAILURE);
        }
        m_changed = FALSE;
        
        // tell all bound objects that the changes have been saved
        DoAllObjects(OBound::ClearChange);       
    }
    
    return(OSUCCESS);
}

// default trigger routines
oresult OBinder::Startup(void)
{return OSUCCESS;}

oresult OBinder::Shutdown(void)
{
    return(SaveRecordChanges());
}

oresult OBinder::PreQuery(void)
{return OSUCCESS;}

oresult OBinder::PostQuery(void)
{return OSUCCESS;}

oresult OBinder::PreDelete(void)
{return OSUCCESS;}

oresult OBinder::PostDelete(void)
{return OSUCCESS;}

oresult OBinder::PreAdd(void)
{
    return(SaveRecordChanges());
}

oresult OBinder::PostAdd(void)
{return OSUCCESS;}

oresult OBinder::PreUpdate(void)
{return OSUCCESS;}

oresult OBinder::PostUpdate(void)
{return OSUCCESS;}

oresult OBinder::PreRollback(void)
{return OSUCCESS;}

oresult OBinder::PostRollback(void)
{return OSUCCESS;}

oresult OBinder::PreMove(void)
{ 
    return(SaveRecordChanges());
}

oresult OBinder::PostMove(void)
{return OSUCCESS;}

oboolean OBinder::IsFirst(void)
{
	return m_dynaset.IsFirst ();
}

oboolean OBinder::IsLast(void)
{
	return m_dynaset.IsLast ();
}

//BUG #262553
long OBinder::ErrorNumber(void) const 
{	// return error "number"
	return m_dynaset.ErrorNumber();
}
	
const char *OBinder::LookupErrorText(long errnum) const 
{	// get error text for given error number
	return m_dynaset.LookupErrorText(errnum);
}
										  
const char *OBinder::GetErrorText(void) const 
{	// get description of last error
	return m_dynaset.GetErrorText();
}

void OBinder::ErrorReset(void) const 
{	// reset error state to "no error"
	m_dynaset.ErrorReset();
}  

int OBinder::GetFieldCount(void) const 
{	// returns # of fields in a record
	return m_dynaset.GetFieldCount();
}
  
long OBinder::GetRecordCount(void) const 
{   // (dangerous!) gets total number of records in dynaset -- downloads the entire dynaset to the client
	return m_dynaset.GetRecordCount();
}
   
int OBinder::GetFieldIndex(const char *fieldname) const
{	// gets the index of a field by name
	return m_dynaset.GetFieldIndex(fieldname);
}
    												
//	V2DEV - extra move methods
oresult OBinder::MovePrevN(long rows)    // go to previous record
{
	return m_dynaset.MovePrevN (rows, FALSE);
}

oresult OBinder::MoveNextN(long rows)    // go to next record - the most frequently used
{
	return m_dynaset.MoveNextN (rows, FALSE);
}
oresult OBinder::MoveRel(long rows)    // go to previous record
{
	return m_dynaset.MoveRel (rows, FALSE);
}
oresult OBinder::MoveTo(long rownum)    // go to next record - the most frequently used
{
	return m_dynaset.MoveTo (rownum, FALSE);
}

// V2DEV -	Find methods
oresult OBinder::FindFirst(const char *sql)
{
	return m_dynaset.FindFirst (sql);
}

oresult OBinder::FindNext(const char *sql)
{
	return m_dynaset.FindNext (sql);
}

oresult OBinder::FindPrevious(const char *sql)
{
	return m_dynaset.FindPrevious (sql);
}

oresult OBinder::FindLast(const char *sql)
{
	return m_dynaset.FindLast (sql);
}

oboolean OBinder::NoMatch(void)			// TRUE if find failed
{
	return m_dynaset.NoMatch ();
}


// ----- OBinderAdvise -----------------------------------------------

oboolean OBinderAdvise::ActionRequest(int otherkind)
{
    // fire pre-action triggers
    
    switch (otherkind)
    {
    case OADVISE_MOVE_FIRST:
    case OADVISE_MOVE_NEXT:
    case OADVISE_MOVE_PREV:
    case OADVISE_MOVE_LAST:
    case OADVISE_FIND_FIRST:
    case OADVISE_FIND_NEXT:
    case OADVISE_FIND_PREV:
    case OADVISE_FIND_LAST:
    case OADVISE_MOVE_TOMARK:
        if (m_binder->PreMove() != OSUCCESS)
            return(FALSE);
        if (m_binder->DoAllObjects(OBound::PreMove) != OSUCCESS)
            return(FALSE);
        break;   
    case OADVISE_DELETE:
        if (m_binder->PreDelete() != OSUCCESS)
            return(FALSE);
        if (m_binder->DoAllObjects(OBound::PreDelete) != OSUCCESS)
            return(FALSE);
        break;
    case OADVISE_ADDNEW:
        if (m_binder->PreAdd() != OSUCCESS)
            return(FALSE);
        if (m_binder->DoAllObjects(OBound::PreAdd) != OSUCCESS)
            return(FALSE);
        break;    
    case OADVISE_UPDATE:
        if (m_binder->PreUpdate() != OSUCCESS)
            return(FALSE);
        if (m_binder->DoAllObjects(OBound::PreUpdate) != OSUCCESS)
            return(FALSE);
        break; 
    case OADVISE_ROLLBACK:
        if (m_binder->PreRollback() != OSUCCESS)
            return(FALSE);
        if (m_binder->DoAllObjects(OBound::PreRollback) != OSUCCESS)
            return(FALSE);
        break;
    case OADVISE_REFRESH:
        if (m_binder->PreQuery() != OSUCCESS)
            return(FALSE);
        if (m_binder->DoAllObjects(OBound::PreQuery) != OSUCCESS)
            return(FALSE);
        break;
    default:
        // unknown triggers 
        // int ii = 3;
        break;
    }
    
    return(TRUE);
}

void OBinderAdvise::ActionNotify(int otherkind)
{
    // fire post-action triggers
    
    switch (otherkind)
    {
    case OADVISE_MOVE_FIRST:
    case OADVISE_MOVE_NEXT:
    case OADVISE_MOVE_PREV:
    case OADVISE_MOVE_LAST:
	case OADVISE_FIND_FIRST:
    case OADVISE_FIND_NEXT:
    case OADVISE_FIND_PREV:
    case OADVISE_FIND_LAST:
    case OADVISE_MOVE_TOMARK:
        if (m_binder->PostMove() != OSUCCESS)
            return;
        m_binder->DoAllObjects(OBound::PostMove);
        break;   
    case OADVISE_DELETE:
        if (m_binder->PostDelete() != OSUCCESS)
            return;
        m_binder->DoAllObjects(OBound::PostDelete);
        break;
    case OADVISE_ADDNEW:
        // the postadd triggers are called directly from AddNewRecord
        //   and Duplicate record.  That's so the trigger is called AFTER
        //   all the dynaset (and in the case of duplicate ODynaset) work
        //   is completely done 
        break;
    case OADVISE_UPDATE:
        if (m_binder->PostUpdate() != OSUCCESS)
            return;
        m_binder->DoAllObjects(OBound::PostUpdate);
        break;
    case OADVISE_ROLLBACK:
        m_binder->Changed(FALSE);  // rollback means changes are gone
        // tell all bound objects that the changes are gone
        m_binder->DoAllObjects(OBound::ClearChange);
               
        if (m_binder->PostRollback() != OSUCCESS)
            return;
        m_binder->DoAllObjects(OBound::PostRollback);
        break;
    case OADVISE_REFRESH:
        m_binder->DoAllObjects(&OBound::GetFieldIndex); // have all the bound objects get their field indices again 
        // is a new field set needed?       
        if (m_binder->PostQuery() != OSUCCESS)
            return;
        m_binder->DoAllObjects(OBound::PostQuery);
        break;
    default:
        // unknown triggers
        break;
    }
    
    return;
}

