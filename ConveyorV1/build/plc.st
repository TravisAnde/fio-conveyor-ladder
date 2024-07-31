TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    ADD10_OUT : UINT;
    EQ13_OUT : BOOL;
    SEL15_OUT : UINT;
    AND7_OUT : BOOL;
  END_VAR

  ADD10_OUT := ADD(COUNTER, 1);
  EQ13_OUT := EQ(N, ADD10_OUT);
  SEL15_OUT := SEL(EQ13_OUT, ADD10_OUT, 0);
  COUNTER := SEL15_OUT;
  AND7_OUT := AND(EQ13_OUT, TRIG);
  py_eval(TRIG := AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM blank_project
  VAR
    StartButton : BOOL;
    SafeDoor : BOOL;
    Box_Not_Waiting : BOOL;
    Picker_Holding : BOOL;
    Picker_Rotating : BOOL;
    Picker_Moving_Z : BOOL;
    Conveyor_Move : BOOL;
    Picker_Move_Down : BOOL;
    Picker_Grab : BOOL;
    Picker_Rotate_CCW : BOOL;
    Picker_Rotate_CW : BOOL;
  END_VAR
  VAR
    RUN : BOOL;
    F_TRIG1 : F_TRIG;
    F_TRIG2 : F_TRIG;
    R_TRIG1 : R_TRIG;
    F_TRIG3 : F_TRIG;
    F_TRIG4 : F_TRIG;
    F_TRIG5 : F_TRIG;
    F_TRIG6 : F_TRIG;
    F_TRIG7 : F_TRIG;
  END_VAR

  RUN := SafeDoor AND StartButton;
  Conveyor_Move := Box_Not_Waiting AND RUN;
  F_TRIG1(CLK := Box_Not_Waiting);
  IF NOT(Picker_Holding) AND F_TRIG1.Q AND RUN THEN
    Picker_Move_Down := TRUE; (*set*)
  END_IF;
  F_TRIG2(CLK := Box_Not_Waiting);
  IF NOT(Picker_Holding) AND F_TRIG2.Q AND RUN THEN
    Picker_Grab := TRUE; (*set*)
  END_IF;
  R_TRIG1(CLK := Picker_Holding);
  IF R_TRIG1.Q AND RUN THEN
    Picker_Move_Down := FALSE; (*reset*)
  END_IF;
  F_TRIG3(CLK := Picker_Moving_Z);
  IF F_TRIG3.Q AND RUN THEN
    Picker_Rotate_CCW := TRUE; (*set*)
  END_IF;
  F_TRIG4(CLK := Picker_Moving_Z);
  IF F_TRIG4.Q AND RUN THEN
    Picker_Rotate_CW := FALSE; (*reset*)
  END_IF;
  F_TRIG5(CLK := Picker_Rotating);
  IF F_TRIG5.Q AND RUN THEN
    Picker_Grab := FALSE; (*reset*)
  END_IF;
  F_TRIG6(CLK := Picker_Rotating);
  IF F_TRIG6.Q AND RUN THEN
    Picker_Rotate_CW := TRUE; (*set*)
  END_IF;
  F_TRIG7(CLK := Picker_Rotating);
  IF F_TRIG7.Q AND RUN THEN
    Picker_Rotate_CCW := FALSE; (*reset*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : blank_project;
  END_RESOURCE
END_CONFIGURATION
