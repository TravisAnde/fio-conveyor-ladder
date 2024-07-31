PROGRAM ConveyorV1
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
  F_TRIG1(CLK := Box_Not_Waiting);
  IF NOT(Picker_Holding) AND F_TRIG1.Q AND RUN THEN
    Picker_Move_Down := TRUE; (*set*)
  END_IF;
  F_TRIG2(CLK := Box_Not_Waiting);
  IF NOT(Picker_Holding) AND F_TRIG2.Q AND RUN THEN
    Picker_Grab := TRUE; (*set*)
  END_IF;
  Conveyor_Move := Box_Not_Waiting AND RUN;
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
    PROGRAM instance0 WITH task0 : ConveyorV1;
  END_RESOURCE
END_CONFIGURATION

(*DBG:char md5[] = "87633f14ac72fe7f603152762d96b9cf";*)
(*DBG:/**)
(*DBG: * This file is part of OpenPLC Runtime*)
(*DBG: **)
(*DBG: * Copyright (C) 2023 Autonomy, GP Orcullo*)
(*DBG: * Based on the work by GP Orcullo on Beremiz for uC*)
(*DBG: **)
(*DBG: * This program is free software; you can redistribute it and/or*)
(*DBG: * modify it under the terms of the GNU General Public License*)
(*DBG: * as published by the Free Software Foundation; either version 2*)
(*DBG: * of the License, or (at your option) any later version.*)
(*DBG: **)
(*DBG: * This program is distributed in the hope that it will be useful,*)
(*DBG: * but WITHOUT ANY WARRANTY; without even the implied warranty of*)
(*DBG: * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the*)
(*DBG: * GNU General Public License for more details.*)
(*DBG: **)
(*DBG: * You should have received a copy of the GNU General Public License*)
(*DBG: * along with this program; If not, see <http://www.gnu.org/licenses/>.*)
(*DBG: **)
(*DBG: */*)
(*DBG:*)
(*DBG:#include <stdbool.h>*)
(*DBG:*)
(*DBG:#include "iec_types_all.h"*)
(*DBG:#include "POUS.h"*)
(*DBG:*)
(*DBG:#define SAME_ENDIANNESS      0*)
(*DBG:#define REVERSE_ENDIANNESS   1*)
(*DBG:*)
(*DBG:uint8_t endianness;*)
(*DBG:*)
(*DBG:*)
(*DBG:extern CONVEYORV1 RES0__INSTANCE0;*)
(*DBG:*)
(*DBG:static const struct {*)
(*DBG:    void *ptr;*)
(*DBG:    __IEC_types_enum type;*)
(*DBG:} debug_vars[] = {*)
(*DBG:    {&(RES0__INSTANCE0.STARTBUTTON), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.SAFEDOOR), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.BOX_NOT_WAITING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_HOLDING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_ROTATING), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_MOVING_Z), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.CONVEYOR_MOVE), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_MOVE_DOWN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_GRAB), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_ROTATE_CCW), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.PICKER_ROTATE_CW), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.RUN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG1.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG1.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG1.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG1.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG1.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG2.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG2.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG2.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG2.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG2.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG1.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG1.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG1.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG1.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.R_TRIG1.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG3.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG3.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG3.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG3.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG3.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG4.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG4.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG4.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG4.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG4.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG5.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG5.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG5.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG5.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG5.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG6.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG6.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG6.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG6.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG6.M), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG7.EN), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG7.ENO), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG7.CLK), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG7.Q), BOOL_ENUM},*)
(*DBG:    {&(RES0__INSTANCE0.F_TRIG7.M), BOOL_ENUM},*)
(*DBG:};*)
(*DBG:*)
(*DBG:#define VAR_COUNT               52*)
(*DBG:*)
(*DBG:uint16_t get_var_count(void)*)
(*DBG:{*)
(*DBG:    return VAR_COUNT;*)
(*DBG:}*)
(*DBG:*)
(*DBG:size_t get_var_size(size_t idx)*)
(*DBG:{*)
(*DBG:    if (idx >= VAR_COUNT)*)
(*DBG:    {*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return sizeof(BOOL);*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void *get_var_addr(size_t idx)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    switch (debug_vars[idx].type) {*)
(*DBG:    case BOOL_ENUM:*)
(*DBG:        return (void *)&((__IEC_BOOL_t *) ptr)->value;*)
(*DBG:    default:*)
(*DBG:        return 0;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void force_var(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    void *ptr = debug_vars[idx].ptr;*)
(*DBG:*)
(*DBG:    if (forced) {*)
(*DBG:        size_t var_size = get_var_size(idx);*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case BOOL_ENUM: {*)
(*DBG:            memcpy(&((__IEC_BOOL_t *) ptr)->value, val, var_size);*)
(*DBG:            //((__IEC_BOOL_t *) ptr)->value = *((BOOL *) val);*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags |= __IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    } else {*)
(*DBG:        switch (debug_vars[idx].type) {*)
(*DBG:        case BOOL_ENUM:*)
(*DBG:            ((__IEC_BOOL_t *) ptr)->flags &= ~__IEC_FORCE_FLAG;*)
(*DBG:            break;*)
(*DBG:        default:*)
(*DBG:            break;*)
(*DBG:        }*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void swap_bytes(void *ptr, size_t size) *)
(*DBG:{*)
(*DBG:    uint8_t *bytePtr = (uint8_t *)ptr;*)
(*DBG:    size_t i;*)
(*DBG:    for (i = 0; i < size / 2; ++i) *)
(*DBG:    {*)
(*DBG:        uint8_t temp = bytePtr[i];*)
(*DBG:        bytePtr[i] = bytePtr[size - 1 - i];*)
(*DBG:        bytePtr[size - 1 - i] = temp;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void trace_reset(void)*)
(*DBG:{*)
(*DBG:    for (size_t i=0; i < VAR_COUNT; i++) *)
(*DBG:    {*)
(*DBG:        force_var(i, false, 0);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_trace(size_t idx, bool forced, void *val)*)
(*DBG:{*)
(*DBG:    if (idx >= 0 && idx < VAR_COUNT) *)
(*DBG:    {*)
(*DBG:        if (endianness == REVERSE_ENDIANNESS)*)
(*DBG:        {*)
(*DBG:            // Aaaaarghhhh... Stupid AVR is Big Endian.*)
(*DBG:            swap_bytes(val, get_var_size(idx));*)
(*DBG:        }*)
(*DBG:*)
(*DBG:        force_var(idx, forced, val);*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
(*DBG:void set_endianness(uint8_t value)*)
(*DBG:{*)
(*DBG:    if (value == SAME_ENDIANNESS || value == REVERSE_ENDIANNESS)*)
(*DBG:    {*)
(*DBG:        endianness = value;*)
(*DBG:    }*)
(*DBG:}*)
(*DBG:*)
