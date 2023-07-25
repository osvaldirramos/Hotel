/* Copyright (c) Oracle Corporation 1994.  All Rights Reserved */

/*
    This source code is provided as a debugging aid for developers
    who have purchased Oracle Objects for OLE    .  Please see the
    online help for documentation of these classes.
*/

/*
    Oracle Objects for OLE     C++ Classes
    
    This file implements a global memory handler
                           
    CREATED    ********   11/22/94

*/

#ifndef ORACL_ORACLE
#include "oracl.h"
#endif

#include <memory.h>

#ifndef ORAOBJI_ORACLE
#include "oraobji.h"
#endif

struct orauga
{
  char signature[6];
  HANDLE taskid;
  oglobal globalstate;
};

#define MAX_TASKS 255
static orauga *ugaptr[MAX_TASKS] = {0};
static HANDLE tasklist[MAX_TASKS] = {0};

static char *tagstr = "OO4O72";

// ----- ssoo4walloc -----------------------------------------------

orauga *ssoo4walloc()
{
  HANDLE  taskid;
  int     index;

#ifdef WIN32 
    taskid = GetCurrentProcess();               /* get the current task id */
#else
    taskid = GetCurrentTask();                  /* get the current task id */
#endif
 

  /* see if we've already allocated a UGA for this taskid */
  for (index = 0; index < MAX_TASKS ; index++)
  {
    if (taskid != tasklist[index]) continue;

    /* OK...taskid == tasklist[index].  Now, make sure ugaptr[index]
       is a pointer to valid memory, and make sure that our signature
       [tagstr] is at the beginning.   */
    if (IsBadWritePtr(ugaptr[index], sizeof(struct orauga) - 1) ||
        memcmp(ugaptr[index], tagstr, 6) ||
        ugaptr[index]->taskid != taskid)
    {
      /* oops..didn't verify.  Windows must be reusing the task
      handle from before. Clear out this entry, set index ==
      MAX_TASKS, and continue */

      tasklist[index] = 0;
      ugaptr[index] = (struct orauga *)0;
      index = MAX_TASKS;
      break;
    }
    else
      break;                                   /* everything's cool...return */
  }

  if (index == MAX_TASKS)                   /* if we're not in the list .... */
  {                                         /*  .... allocate and initialize */

    for (index = 0; index < MAX_TASKS; index++)       /* find 1st free entry */
      if (!tasklist[index])
        break;
    tasklist[index] = taskid;
    ugaptr[index] = new orauga; 
    
    // clear the new structure
    memset(ugaptr[index], 0, sizeof(orauga));
    
    // tag the structure
    memcpy(ugaptr[index], tagstr, 6);
    
    ugaptr[index]->taskid = taskid;
  }

  return(ugaptr[index]);                        /* return pointer to the UGA */
}

// ----- ssoo4wfree -----------------------------------------------
void ssoo4wfree()
{
  HANDLE taskid;
  int index;

#ifdef WIN32 
    taskid = GetCurrentProcess();                 /* get the current task id */
#else
    taskid = GetCurrentTask();                    /* get the current task id */
#endif


  for (index = 0; index < MAX_TASKS; index++)
  {
    if (tasklist[index] == taskid && ugaptr[index])
    {
      delete ugaptr[index];
      tasklist[index] = 0;
      ugaptr[index] = (struct orauga *)0;
      break;
    }
  }
}

// ----- ssoo4wGetGlobal -----------------------------------------------
oglobal *ssoo4wGetGlobal(void)
{
    orauga *gp = ssoo4walloc();
    return(&gp->globalstate);
}


