-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\frame_inspector_shift\hdlsrc\frame_inspector_shift_test\frame_inspector_shift_src_fft_shift_di_pkg.vhd
-- Created: 2021-02-26 00:15:25
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE frame_inspector_shift_src_fft_shift_di_pkg IS
  TYPE T_state_type_is_control IS (IN_idle, IN_init, IN_read, IN_read_idle, IN_wait, IN_wait_update, IN_write_bottom, IN_write_top);
END frame_inspector_shift_src_fft_shift_di_pkg;

