PROGRAM blank_project
  VAR
    StartButton AT %IX100.0 : BOOL;
    SafeDoor AT %IX100.1 : BOOL;
    Box_Not_Waiting AT %IX100.2 : BOOL;
    Picker_Holding AT %IX100.3 : BOOL;
    Picker_Rotating AT %IX100.4 : BOOL;
    Picker_Moving_Z AT %IX100.5 : BOOL;
    Conveyor_Move AT %QX100.0 : BOOL;
    Picker_Move_Down AT %QX100.1 : BOOL;
    Picker_Grab AT %QX100.2 : BOOL;
    Picker_Rotate_CCW AT %QX100.3 : BOOL;
    Picker_Rotate_CW AT %QX100.4 : BOOL;
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
