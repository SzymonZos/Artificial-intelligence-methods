/*
 * MPC0.h
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

#ifndef RTW_HEADER_MPC0_h_
#define RTW_HEADER_MPC0_h_
#include <float.h>
#include <string.h>
#include <stddef.h>
#ifndef MPC0_COMMON_INCLUDES_
# define MPC0_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#endif                                 /* MPC0_COMMON_INCLUDES_ */

#include "MPC0_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWLogInfo
# define rtmGetRTWLogInfo(rtm)         ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  real_T last_mv_DSTATE;               /* '<S2>/last_mv' */
  real_T last_x_PreviousInput[2];      /* '<S2>/last_x' */
} DW_MPC0_T;

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T moorx;                        /* '<Root>/mo or x' */
  real_T ref;                          /* '<Root>/ref' */
  real_T md;                           /* '<Root>/md' */
} ExtU_MPC0_T;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T mv;                           /* '<Root>/mv' */
} ExtY_MPC0_T;

/* Parameters (auto storage) */
struct P_MPC0_T_ {
  real_T extmv_zero_Value;             /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ext.mv_zero'
                                        */
  real_T extmv_scale_Gain;             /* Expression: MVscale
                                        * Referenced by: '<S2>/ext.mv_scale'
                                        */
  real_T mvtarget_zero_Value;          /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/mv.target_zero'
                                        */
  real_T extmv_scale1_Gain;            /* Expression: MVscale
                                        * Referenced by: '<S2>/ext.mv_scale1'
                                        */
  real_T last_mv_InitialCondition;     /* Expression: lastu+uoff
                                        * Referenced by: '<S2>/last_mv'
                                        */
  real_T last_x_X0[2];                 /* Expression: lastx+xoff
                                        * Referenced by: '<S2>/last_x'
                                        */
  real_T umin_zero_Value;              /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/umin_zero'
                                        */
  real_T umin_scale_Gain;              /* Expression: MVscale
                                        * Referenced by: '<S2>/umin_scale'
                                        */
  real_T umax_zero_Value;              /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/umax_zero'
                                        */
  real_T umax_scale_Gain;              /* Expression: MVscale
                                        * Referenced by: '<S2>/umax_scale'
                                        */
  real_T ymin_zero_Value;              /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ymin_zero'
                                        */
  real_T ymin_scale_Gain;              /* Expression: Rscale
                                        * Referenced by: '<S2>/ymin_scale'
                                        */
  real_T ymax_zero_Value;              /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ymax_zero'
                                        */
  real_T ymax_scale_Gain;              /* Expression: Rscale
                                        * Referenced by: '<S2>/ymax_scale'
                                        */
  real_T switch_zero_Value;            /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/switch_zero'
                                        */
  real_T ywt_zero_Value;               /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/y.wt_zero'
                                        */
  real_T uwt_zero_Value;               /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/u.wt_zero'
                                        */
  real_T duwt_zero_Value;              /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/du.wt_zero'
                                        */
  real_T ecrwt_zero_Value;             /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ecr.wt_zero'
                                        */
  real_T umin_scale1_Gain;             /* Expression: 1./MVscale
                                        * Referenced by: '<S2>/umin_scale1'
                                        */
  boolean_T Memory_X0;                 /* Expression: iA
                                        * Referenced by: '<S2>/Memory'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_MPC0_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

/* Block parameters (auto storage) */
extern P_MPC0_T MPC0_P;

/* Block states (auto storage) */
extern DW_MPC0_T MPC0_DW;

/* External inputs (root inport signals with auto storage) */
extern ExtU_MPC0_T MPC0_U;

/* External outputs (root outports fed by signals with auto storage) */
extern ExtY_MPC0_T MPC0_Y;

/* Model entry point functions */
extern void MPC0_initialize(void);
extern void MPC0_step(void);
extern void MPC0_terminate(void);

/* Real-time Model object */
extern RT_MODEL_MPC0_T *const MPC0_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('untitled/MPC Controller')    - opens subsystem untitled/MPC Controller
 * hilite_system('untitled/MPC Controller/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'untitled'
 * '<S1>'   : 'untitled/MPC Controller'
 * '<S2>'   : 'untitled/MPC Controller/MPC'
 * '<S3>'   : 'untitled/MPC Controller/MPC/MPC Preview Signal Check'
 * '<S4>'   : 'untitled/MPC Controller/MPC/MPC Preview Signal Check1'
 * '<S5>'   : 'untitled/MPC Controller/MPC/MPC Scalar Signal Check'
 * '<S6>'   : 'untitled/MPC Controller/MPC/MPC Scalar Signal Check1'
 * '<S7>'   : 'untitled/MPC Controller/MPC/MPC Vector Signal Check'
 * '<S8>'   : 'untitled/MPC Controller/MPC/MPC Vector Signal Check11'
 * '<S9>'   : 'untitled/MPC Controller/MPC/MPC Vector Signal Check2'
 * '<S10>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check3'
 * '<S11>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check4'
 * '<S12>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check5'
 * '<S13>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check6'
 * '<S14>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check7'
 * '<S15>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check8'
 * '<S16>'  : 'untitled/MPC Controller/MPC/MPC Vector Signal Check9'
 * '<S17>'  : 'untitled/MPC Controller/MPC/optimizer'
 */
#endif                                 /* RTW_HEADER_MPC0_h_ */
