/*
 * MPC0_data.c
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

/* Block parameters (auto storage) */
P_MPC0_T MPC0_P = {
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ext.mv_zero'
                                        */
  1.0,                                 /* Expression: MVscale
                                        * Referenced by: '<S2>/ext.mv_scale'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/mv.target_zero'
                                        */
  1.0,                                 /* Expression: MVscale
                                        * Referenced by: '<S2>/ext.mv_scale1'
                                        */
  0.0,                                 /* Expression: lastu+uoff
                                        * Referenced by: '<S2>/last_mv'
                                        */

  /*  Expression: lastx+xoff
   * Referenced by: '<S2>/last_x'
   */
  { 0.0, 0.0 },
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/umin_zero'
                                        */
  1.0,                                 /* Expression: MVscale
                                        * Referenced by: '<S2>/umin_scale'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/umax_zero'
                                        */
  1.0,                                 /* Expression: MVscale
                                        * Referenced by: '<S2>/umax_scale'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ymin_zero'
                                        */
  1.0,                                 /* Expression: Rscale
                                        * Referenced by: '<S2>/ymin_scale'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ymax_zero'
                                        */
  1.0,                                 /* Expression: Rscale
                                        * Referenced by: '<S2>/ymax_scale'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/switch_zero'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/y.wt_zero'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/u.wt_zero'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/du.wt_zero'
                                        */
  0.0,                                 /* Expression: zeros(1,1)
                                        * Referenced by: '<S1>/ecr.wt_zero'
                                        */
  1.0,                                 /* Expression: 1./MVscale
                                        * Referenced by: '<S2>/umin_scale1'
                                        */
  0                                    /* Expression: iA
                                        * Referenced by: '<S2>/Memory'
                                        */
};
