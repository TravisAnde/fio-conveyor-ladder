void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_EVAL_body__() 





void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_POLL_body__() 





void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->N,0,retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  PYTHON_EVAL_init__(&data__->PY_EVAL,retain);
  __INIT_VAR(data__->COUNTER,0,retain)
  __INIT_VAR(data__->ADD10_OUT,0,retain)
  __INIT_VAR(data__->EQ13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEL15_OUT,0,retain)
  __INIT_VAR(data__->AND7_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,ADD10_OUT,,ADD__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->COUNTER,),
    (UINT)1));
  __SET_VAR(data__->,EQ13_OUT,,EQ__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->N,),
    (UINT)__GET_VAR(data__->ADD10_OUT,)));
  __SET_VAR(data__->,SEL15_OUT,,SEL__UINT__BOOL__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (UINT)__GET_VAR(data__->ADD10_OUT,),
    (UINT)0));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->SEL15_OUT,));
  __SET_VAR(data__->,AND7_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (BOOL)__GET_VAR(data__->TRIG,)));
  __SET_VAR(data__->PY_EVAL.,TRIG,,__GET_VAR(data__->AND7_OUT,));
  __SET_VAR(data__->PY_EVAL.,CODE,,__GET_VAR(data__->CODE,));
  PYTHON_EVAL_body__(&data__->PY_EVAL);
  __SET_VAR(data__->,ACK,,__GET_VAR(data__->PY_EVAL.ACK,));
  __SET_VAR(data__->,RESULT,,__GET_VAR(data__->PY_EVAL.RESULT,));

  goto __end;

__end:
  return;
} // PYTHON_GEAR_body__() 





void BLANK_PROJECT_init__(BLANK_PROJECT *data__, BOOL retain) {
  __INIT_VAR(data__->STARTBUTTON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SAFEDOOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BOX_NOT_WAITING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_HOLDING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_ROTATING,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_MOVING_Z,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CONVEYOR_MOVE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_MOVE_DOWN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_GRAB,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_ROTATE_CCW,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PICKER_ROTATE_CW,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RUN,__BOOL_LITERAL(FALSE),retain)
  F_TRIG_init__(&data__->F_TRIG1,retain);
  F_TRIG_init__(&data__->F_TRIG2,retain);
  R_TRIG_init__(&data__->R_TRIG1,retain);
  F_TRIG_init__(&data__->F_TRIG3,retain);
  F_TRIG_init__(&data__->F_TRIG4,retain);
  F_TRIG_init__(&data__->F_TRIG5,retain);
  F_TRIG_init__(&data__->F_TRIG6,retain);
  F_TRIG_init__(&data__->F_TRIG7,retain);
}

// Code part
void BLANK_PROJECT_body__(BLANK_PROJECT *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,RUN,,(__GET_VAR(data__->SAFEDOOR,) && __GET_VAR(data__->STARTBUTTON,)));
  __SET_VAR(data__->,CONVEYOR_MOVE,,(__GET_VAR(data__->BOX_NOT_WAITING,) && __GET_VAR(data__->RUN,)));
  __SET_VAR(data__->F_TRIG1.,CLK,,__GET_VAR(data__->BOX_NOT_WAITING,));
  F_TRIG_body__(&data__->F_TRIG1);
  if (((!(__GET_VAR(data__->PICKER_HOLDING,)) && __GET_VAR(data__->F_TRIG1.Q,)) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_MOVE_DOWN,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->F_TRIG2.,CLK,,__GET_VAR(data__->BOX_NOT_WAITING,));
  F_TRIG_body__(&data__->F_TRIG2);
  if (((!(__GET_VAR(data__->PICKER_HOLDING,)) && __GET_VAR(data__->F_TRIG2.Q,)) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_GRAB,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->R_TRIG1.,CLK,,__GET_VAR(data__->PICKER_HOLDING,));
  R_TRIG_body__(&data__->R_TRIG1);
  if ((__GET_VAR(data__->R_TRIG1.Q,) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_MOVE_DOWN,,__BOOL_LITERAL(FALSE));
  };
  __SET_VAR(data__->F_TRIG3.,CLK,,__GET_VAR(data__->PICKER_MOVING_Z,));
  F_TRIG_body__(&data__->F_TRIG3);
  if ((__GET_VAR(data__->F_TRIG3.Q,) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_ROTATE_CCW,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->F_TRIG4.,CLK,,__GET_VAR(data__->PICKER_MOVING_Z,));
  F_TRIG_body__(&data__->F_TRIG4);
  if ((__GET_VAR(data__->F_TRIG4.Q,) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_ROTATE_CW,,__BOOL_LITERAL(FALSE));
  };
  __SET_VAR(data__->F_TRIG5.,CLK,,__GET_VAR(data__->PICKER_ROTATING,));
  F_TRIG_body__(&data__->F_TRIG5);
  if ((__GET_VAR(data__->F_TRIG5.Q,) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_GRAB,,__BOOL_LITERAL(FALSE));
  };
  __SET_VAR(data__->F_TRIG6.,CLK,,__GET_VAR(data__->PICKER_ROTATING,));
  F_TRIG_body__(&data__->F_TRIG6);
  if ((__GET_VAR(data__->F_TRIG6.Q,) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_ROTATE_CW,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->F_TRIG7.,CLK,,__GET_VAR(data__->PICKER_ROTATING,));
  F_TRIG_body__(&data__->F_TRIG7);
  if ((__GET_VAR(data__->F_TRIG7.Q,) && __GET_VAR(data__->RUN,))) {
    __SET_VAR(data__->,PICKER_ROTATE_CCW,,__BOOL_LITERAL(FALSE));
  };

  goto __end;

__end:
  return;
} // BLANK_PROJECT_body__() 





