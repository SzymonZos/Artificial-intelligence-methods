/*
 * MPC0.c
 *
 * Code generation for model "MPC0".
 *
 * Model version              : 1.0
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Thu Nov 07 11:27:04 2019
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "MPC0.h"
#include "MPC0_private.h"

/* Block states (auto storage) */
DW_MPC0_T MPC0_DW;

/* External inputs (root inport signals with auto storage) */
ExtU_MPC0_T MPC0_U;

/* External outputs (root outports fed by signals with auto storage) */
ExtY_MPC0_T MPC0_Y;

/* Real-time model */
RT_MODEL_MPC0_T MPC0_M_;
RT_MODEL_MPC0_T *const MPC0_M = &MPC0_M_;

/* Model step function */
void MPC0_step(void)
{
  real_T delmv;
  real_T rtb_extmv_scale;
  real_T rtb_xest_idx_0;
  real_T rtb_xest_idx_1;

  /* Gain: '<S2>/ext.mv_scale' incorporates:
   *  Constant: '<S1>/ext.mv_zero'
   */
  rtb_extmv_scale = MPC0_P.extmv_scale_Gain * MPC0_P.extmv_zero_Value;

  /* MATLAB Function: '<S2>/optimizer' incorporates:
   *  Inport: '<Root>/mo or x'
   *  Memory: '<S2>/last_x'
   *  UnitDelay: '<S2>/last_mv'
   */
  /* MATLAB Function 'MPC Controller/MPC/optimizer': '<S17>:1' */
  /*  Parameters */
  /*  Pre-allocate all the MEX block outputs for the simulation mode */
  /*  Get reference and MD signals -- accounting for previewing */
  /*  When doing code generation, use M code directly */
  /*  External MV override.   */
  /*  NOTE: old_u and ext_mv input signals are dimensionless but include offset */
  /* '<S17>:1:56' */
  /* '<S17>:1:60' */
  /*  Bias correction */
  /* '<S17>:1:61' */
  delmv = rtb_extmv_scale - MPC0_DW.last_mv_DSTATE;

  /*  Obtain x[k|k] */
  /* '<S17>:1:66' */
  /*  Remove offset */
  /*  Default state estimation.     */
  /*  Scale measured output and remove offset. */
  /* '<S17>:1:73' */
  /*  Correct x(k|k-1) for possible external mv override. */
  /*  NOTE:  Offset was removed from x[k|k-1] at k=0. */
  /* '<S17>:1:76' */
  rtb_xest_idx_0 = 0.0 * delmv + MPC0_DW.last_x_PreviousInput[0];
  rtb_xest_idx_1 = 0.0 * delmv + MPC0_DW.last_x_PreviousInput[1];

  /*  Measurement upate to x(k|k) */
  /* '<S17>:1:78' */
  /* '<S17>:1:79' */
  delmv = MPC0_U.moorx - (0.0 * rtb_xest_idx_0 + 0.0 * rtb_xest_idx_1);

  /* Outport: '<Root>/mv' incorporates:
   *  Gain: '<S2>/umin_scale1'
   *  MATLAB Function: '<S2>/optimizer'
   */
  /* '<S17>:1:80' */
  /*  Real-time MV target override */
  /*  Note: utargetValue is a vector length p*nu.   */
  /*  utarget is a vector length p*nu.  Define constant targets for the */
  /*  entire horizon. */
  /*  Bias correction */
  /*  When doing code generation, use M code directly */
  /* '<S17>:1:122' */
  /*  update x[k+1|k], assuming that above u and v will be applied. */
  /* '<S17>:1:138' */
  /* '<S17>:1:140' */
  /*  Updated state must include offset */
  /* '<S17>:1:146' */
  MPC0_Y.mv = MPC0_P.umin_scale1_Gain * rtb_extmv_scale;

  /* Update for UnitDelay: '<S2>/last_mv' incorporates:
   *  MATLAB Function: '<S2>/optimizer'
   */
  MPC0_DW.last_mv_DSTATE = rtb_extmv_scale;

  /* Update for Memory: '<S2>/last_x' incorporates:
   *  MATLAB Function: '<S2>/optimizer'
   */
  MPC0_DW.last_x_PreviousInput[0] = ((0.0 * rtb_xest_idx_0 + 0.0 *
    rtb_xest_idx_1) + 0.0 * rtb_extmv_scale) + 0.0 * delmv;
  MPC0_DW.last_x_PreviousInput[1] = ((0.0 * rtb_xest_idx_0 + 0.0 *
    rtb_xest_idx_1) + 0.0 * rtb_extmv_scale) + 0.0 * delmv;

  /* Matfile logging */
  rt_UpdateTXYLogVars(MPC0_M->rtwLogInfo, (&MPC0_M->Timing.taskTime0));

  /* signal main to stop simulation */
  {                                    /* Sample time: [1.0s, 0.0s] */
    if ((rtmGetTFinal(MPC0_M)!=-1) &&
        !((rtmGetTFinal(MPC0_M)-MPC0_M->Timing.taskTime0) >
          MPC0_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(MPC0_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++MPC0_M->Timing.clockTick0)) {
    ++MPC0_M->Timing.clockTickH0;
  }

  MPC0_M->Timing.taskTime0 = MPC0_M->Timing.clockTick0 *
    MPC0_M->Timing.stepSize0 + MPC0_M->Timing.clockTickH0 *
    MPC0_M->Timing.stepSize0 * 4294967296.0;
}

/* Model initialize function */
void MPC0_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)MPC0_M, 0,
                sizeof(RT_MODEL_MPC0_T));
  rtmSetTFinal(MPC0_M, 10.0);
  MPC0_M->Timing.stepSize0 = 1.0;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    MPC0_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(MPC0_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(MPC0_M->rtwLogInfo, (NULL));
    rtliSetLogT(MPC0_M->rtwLogInfo, "tout");
    rtliSetLogX(MPC0_M->rtwLogInfo, "");
    rtliSetLogXFinal(MPC0_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(MPC0_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(MPC0_M->rtwLogInfo, 0);
    rtliSetLogMaxRows(MPC0_M->rtwLogInfo, 1000);
    rtliSetLogDecimation(MPC0_M->rtwLogInfo, 1);

    /*
     * Set pointers to the data and signal info for each output
     */
    {
      static void * rt_LoggedOutputSignalPtrs[] = {
        &MPC0_Y.mv
      };

      rtliSetLogYSignalPtrs(MPC0_M->rtwLogInfo, ((LogSignalPtrsType)
        rt_LoggedOutputSignalPtrs));
    }

    {
      static int_T rt_LoggedOutputWidths[] = {
        1
      };

      static int_T rt_LoggedOutputNumDimensions[] = {
        1
      };

      static int_T rt_LoggedOutputDimensions[] = {
        1
      };

      static boolean_T rt_LoggedOutputIsVarDims[] = {
        0
      };

      static void* rt_LoggedCurrentSignalDimensions[] = {
        (NULL)
      };

      static int_T rt_LoggedCurrentSignalDimensionsSize[] = {
        4
      };

      static BuiltInDTypeId rt_LoggedOutputDataTypeIds[] = {
        SS_DOUBLE
      };

      static int_T rt_LoggedOutputComplexSignals[] = {
        0
      };

      static const char_T *rt_LoggedOutputLabels[] = {
        "" };

      static const char_T *rt_LoggedOutputBlockNames[] = {
        "MPC0/mv" };

      static RTWLogDataTypeConvert rt_RTWLogDataTypeConvert[] = {
        { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0 }
      };

      static RTWLogSignalInfo rt_LoggedOutputSignalInfo[] = {
        {
          1,
          rt_LoggedOutputWidths,
          rt_LoggedOutputNumDimensions,
          rt_LoggedOutputDimensions,
          rt_LoggedOutputIsVarDims,
          rt_LoggedCurrentSignalDimensions,
          rt_LoggedCurrentSignalDimensionsSize,
          rt_LoggedOutputDataTypeIds,
          rt_LoggedOutputComplexSignals,
          (NULL),

          { rt_LoggedOutputLabels },
          (NULL),
          (NULL),
          (NULL),

          { rt_LoggedOutputBlockNames },

          { (NULL) },
          (NULL),
          rt_RTWLogDataTypeConvert
        }
      };

      rtliSetLogYSignalInfo(MPC0_M->rtwLogInfo, rt_LoggedOutputSignalInfo);

      /* set currSigDims field */
      rt_LoggedCurrentSignalDimensions[0] = &rt_LoggedOutputWidths[0];
    }

    rtliSetLogY(MPC0_M->rtwLogInfo, "yout");
  }

  /* states (dwork) */
  (void) memset((void *)&MPC0_DW, 0,
                sizeof(DW_MPC0_T));

  /* external inputs */
  (void) memset((void *)&MPC0_U, 0,
                sizeof(ExtU_MPC0_T));

  /* external outputs */
  MPC0_Y.mv = 0.0;

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(MPC0_M->rtwLogInfo, 0.0, rtmGetTFinal(MPC0_M),
    MPC0_M->Timing.stepSize0, (&rtmGetErrorStatus(MPC0_M)));

  /* InitializeConditions for UnitDelay: '<S2>/last_mv' */
  MPC0_DW.last_mv_DSTATE = MPC0_P.last_mv_InitialCondition;

  /* InitializeConditions for Memory: '<S2>/last_x' */
  MPC0_DW.last_x_PreviousInput[0] = MPC0_P.last_x_X0[0];
  MPC0_DW.last_x_PreviousInput[1] = MPC0_P.last_x_X0[1];
}

/* Model terminate function */
void MPC0_terminate(void)
{
  /* (no terminate code required) */
}
