-- -------------------------------------------------------------
-- 
-- File Name: C:\Git\rfsoc_ofdm\boards\ip\models\hdl_prj\frame_inspector_shift\hdlsrc\frame_inspector_shift_test\frame_inspector_shift_src_control.vhd
-- Created: 2021-02-26 00:15:25
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: frame_inspector_shift_src_control
-- Source Path: frame_inspector_shift_test/fft_shift_di/control
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.frame_inspector_shift_src_fft_shift_di_pkg.ALL;

ENTITY frame_inspector_shift_src_control IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dma_tready                        :   IN    std_logic;
        sof                               :   IN    std_logic;
        tvalid                            :   IN    std_logic;
        addr                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- int16
        wr_en                             :   OUT   std_logic;
        out_tvalid                        :   OUT   std_logic
        );
END frame_inspector_shift_src_control;


ARCHITECTURE rtl OF frame_inspector_shift_src_control IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL is_control                       : T_state_type_is_control;  -- uint8
  SIGNAL addr_tmp                         : signed(15 DOWNTO 0);  -- int16
  SIGNAL read_flag                        : std_logic;
  SIGNAL addr_reg                         : signed(15 DOWNTO 0);  -- int16
  SIGNAL wr_en_reg                        : std_logic;
  SIGNAL out_tvalid_reg                   : std_logic;
  SIGNAL is_control_next                  : T_state_type_is_control;  -- enum type state_type_is_control (8 enums)
  SIGNAL read_flag_next                   : std_logic;
  SIGNAL addr_reg_next                    : signed(15 DOWNTO 0);  -- int16
  SIGNAL wr_en_reg_next                   : std_logic;
  SIGNAL out_tvalid_reg_next              : std_logic;

BEGIN
  control_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      is_control <= IN_init;
      -- variables
      read_flag <= '0';
      -- outputs
      addr_reg <= to_signed(16#001F#, 16);
      wr_en_reg <= '0';
      out_tvalid_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        is_control <= is_control_next;
        read_flag <= read_flag_next;
        addr_reg <= addr_reg_next;
        wr_en_reg <= wr_en_reg_next;
        out_tvalid_reg <= out_tvalid_reg_next;
      END IF;
    END IF;
  END PROCESS control_process;

  control_output : PROCESS (addr_reg, dma_tready, is_control, out_tvalid_reg, read_flag, sof, tvalid,
       wr_en_reg)
    VARIABLE sf_internal_predicateOutput : std_logic;
    VARIABLE b_sf_internal_predicateOutput : std_logic;
    VARIABLE c_sf_internal_predicateOutput : std_logic;
    VARIABLE sf_internal_predicateoutput_0 : std_logic;
    VARIABLE sf_internal_predicateoutput_1 : std_logic;
    VARIABLE sf_internal_predicateoutput_2 : std_logic;
    VARIABLE sf_internal_predicateoutput_3 : std_logic;
    VARIABLE b_sf_internal_predicateoutput_0 : std_logic;
    VARIABLE sf_internal_predicateoutput_4 : std_logic;
    VARIABLE guard1 : std_logic;
    VARIABLE addr_reg_temp : signed(15 DOWNTO 0);
    VARIABLE add_temp : signed(17 DOWNTO 0);
    VARIABLE add_temp_0 : signed(17 DOWNTO 0);
    VARIABLE add_temp_1 : signed(17 DOWNTO 0);
    VARIABLE add_temp_2 : signed(17 DOWNTO 0);
    VARIABLE add_temp_3 : signed(17 DOWNTO 0);
    VARIABLE add_temp_4 : signed(17 DOWNTO 0);
    VARIABLE add_temp_5 : signed(17 DOWNTO 0);
    VARIABLE add_temp_6 : signed(17 DOWNTO 0);
    VARIABLE add_temp_7 : signed(17 DOWNTO 0);
    VARIABLE add_temp_8 : signed(17 DOWNTO 0);
  BEGIN
    sf_internal_predicateoutput_4 := '0';
    sf_internal_predicateOutput := '0';
    b_sf_internal_predicateOutput := '0';
    c_sf_internal_predicateOutput := '0';
    sf_internal_predicateoutput_0 := '0';
    sf_internal_predicateoutput_1 := '0';
    sf_internal_predicateoutput_2 := '0';
    sf_internal_predicateoutput_3 := '0';
    b_sf_internal_predicateoutput_0 := '0';
    add_temp := to_signed(16#00000#, 18);
    add_temp_0 := to_signed(16#00000#, 18);
    add_temp_1 := to_signed(16#00000#, 18);
    add_temp_2 := to_signed(16#00000#, 18);
    add_temp_3 := to_signed(16#00000#, 18);
    add_temp_4 := to_signed(16#00000#, 18);
    add_temp_5 := to_signed(16#00000#, 18);
    add_temp_6 := to_signed(16#00000#, 18);
    add_temp_7 := to_signed(16#00000#, 18);
    add_temp_8 := to_signed(16#00000#, 18);
    addr_reg_temp := addr_reg;
    wr_en_reg_next <= wr_en_reg;
    out_tvalid_reg_next <= out_tvalid_reg;
    is_control_next <= is_control;
    read_flag_next <= read_flag;
    guard1 := '0';
    CASE is_control IS
      WHEN IN_idle =>
        sf_internal_predicateOutput := hdlcoder_to_stdlogic((tvalid AND hdlcoder_to_stdlogic(addr_reg = to_signed(16#003F#, 16))) = '1');
        IF sf_internal_predicateOutput = '1' THEN 
          addr_reg_temp := X"FFFF";
          guard1 := '1';
        ELSE 
          b_sf_internal_predicateOutput := hdlcoder_to_stdlogic((tvalid AND hdlcoder_to_stdlogic(addr_reg > to_signed(16#001E#, 16))) = '1');
          IF b_sf_internal_predicateOutput = '1' THEN 
            is_control_next <= IN_write_top;
            -- variables
            IF dma_tready = '1' THEN 
              read_flag_next <= '1';
            END IF;
            -- outputs
            add_temp_5 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
            IF (add_temp_5(17) = '0') AND (add_temp_5(16 DOWNTO 15) /= "00") THEN 
              addr_reg_temp := X"7FFF";
            ELSIF (add_temp_5(17) = '1') AND (add_temp_5(16 DOWNTO 15) /= "11") THEN 
              addr_reg_temp := X"8000";
            ELSE 
              addr_reg_temp := add_temp_5(15 DOWNTO 0);
            END IF;
            wr_en_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          ELSE 
            c_sf_internal_predicateOutput := hdlcoder_to_stdlogic((tvalid AND hdlcoder_to_stdlogic(addr_reg < to_signed(16#001F#, 16))) = '1');
            IF c_sf_internal_predicateOutput = '1' THEN 
              guard1 := '1';
            ELSE 
              -- variables
              IF dma_tready = '1' THEN 
                read_flag_next <= '1';
              END IF;
              -- outputs
              wr_en_reg_next <= '0';
              out_tvalid_reg_next <= '0';
            END IF;
          END IF;
        END IF;
      WHEN IN_init =>
        sf_internal_predicateoutput_0 := hdlcoder_to_stdlogic((sof AND tvalid) = '1');
        IF sf_internal_predicateoutput_0 = '1' THEN 
          is_control_next <= IN_write_top;
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          add_temp_1 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
          IF (add_temp_1(17) = '0') AND (add_temp_1(16 DOWNTO 15) /= "00") THEN 
            addr_reg_temp := X"7FFF";
          ELSIF (add_temp_1(17) = '1') AND (add_temp_1(16 DOWNTO 15) /= "11") THEN 
            addr_reg_temp := X"8000";
          ELSE 
            addr_reg_temp := add_temp_1(15 DOWNTO 0);
          END IF;
          wr_en_reg_next <= '1';
          out_tvalid_reg_next <= '0';
        ELSE 
          -- variables
          read_flag_next <= '0';
          -- outputs
          addr_reg_temp := to_signed(16#001F#, 16);
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        END IF;
      WHEN IN_read =>
        IF ( NOT dma_tready) = '1' THEN 
          is_control_next <= IN_read_idle;
          -- variables
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSIF addr_reg = to_signed(16#003F#, 16) THEN 
          addr_reg_temp := to_signed(16#001F#, 16);
          is_control_next <= IN_wait_update;
          -- variables
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          -- variables
          -- outputs
          add_temp := resize(addr_reg, 18) + to_signed(16#00001#, 18);
          IF (add_temp(17) = '0') AND (add_temp(16 DOWNTO 15) /= "00") THEN 
            addr_reg_temp := X"7FFF";
          ELSIF (add_temp(17) = '1') AND (add_temp(16 DOWNTO 15) /= "11") THEN 
            addr_reg_temp := X"8000";
          ELSE 
            addr_reg_temp := add_temp(15 DOWNTO 0);
          END IF;
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '1';
        END IF;
      WHEN IN_read_idle =>
        IF dma_tready = '1' THEN 
          is_control_next <= IN_read;
          -- variables
          -- outputs
          add_temp_0 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
          IF (add_temp_0(17) = '0') AND (add_temp_0(16 DOWNTO 15) /= "00") THEN 
            addr_reg_temp := X"7FFF";
          ELSIF (add_temp_0(17) = '1') AND (add_temp_0(16 DOWNTO 15) /= "11") THEN 
            addr_reg_temp := X"8000";
          ELSE 
            addr_reg_temp := add_temp_0(15 DOWNTO 0);
          END IF;
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '1';
        ELSE 
          -- variables
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        END IF;
      WHEN IN_wait =>
        sf_internal_predicateoutput_1 := hdlcoder_to_stdlogic((sof AND tvalid) = '1');
        IF sf_internal_predicateoutput_1 = '1' THEN 
          is_control_next <= IN_write_top;
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          add_temp_2 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
          IF (add_temp_2(17) = '0') AND (add_temp_2(16 DOWNTO 15) /= "00") THEN 
            addr_reg_temp := X"7FFF";
          ELSIF (add_temp_2(17) = '1') AND (add_temp_2(16 DOWNTO 15) /= "11") THEN 
            addr_reg_temp := X"8000";
          ELSE 
            addr_reg_temp := add_temp_2(15 DOWNTO 0);
          END IF;
          wr_en_reg_next <= '1';
          out_tvalid_reg_next <= '0';
        ELSIF read_flag = '1' THEN 
          read_flag_next <= '0';
          is_control_next <= IN_read;
          -- variables
          -- outputs
          addr_reg_temp := to_signed(16#0000#, 16);
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '1';
        ELSE 
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        END IF;
      WHEN IN_wait_update =>
        sf_internal_predicateoutput_2 := hdlcoder_to_stdlogic((sof AND tvalid) = '1');
        IF sf_internal_predicateoutput_2 = '1' THEN 
          is_control_next <= IN_write_top;
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          add_temp_3 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
          IF (add_temp_3(17) = '0') AND (add_temp_3(16 DOWNTO 15) /= "00") THEN 
            addr_reg_temp := X"7FFF";
          ELSIF (add_temp_3(17) = '1') AND (add_temp_3(16 DOWNTO 15) /= "11") THEN 
            addr_reg_temp := X"8000";
          ELSE 
            addr_reg_temp := add_temp_3(15 DOWNTO 0);
          END IF;
          wr_en_reg_next <= '1';
          out_tvalid_reg_next <= '0';
        ELSE 
          -- variables
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        END IF;
      WHEN IN_write_bottom =>
        sf_internal_predicateoutput_3 := hdlcoder_to_stdlogic((read_flag AND hdlcoder_to_stdlogic(addr_reg = to_signed(16#001F#, 16))) = '1');
        IF sf_internal_predicateoutput_3 = '1' THEN 
          read_flag_next <= '0';
          is_control_next <= IN_read;
          -- variables
          -- outputs
          addr_reg_temp := to_signed(16#0000#, 16);
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '1';
        ELSIF addr_reg = to_signed(16#001F#, 16) THEN 
          is_control_next <= IN_wait;
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSIF ( NOT tvalid) = '1' THEN 
          is_control_next <= IN_idle;
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          b_sf_internal_predicateoutput_0 := hdlcoder_to_stdlogic(((sof AND tvalid) AND hdlcoder_to_stdlogic(addr_reg = to_signed(16#001F#, 16))) = '1');
          IF b_sf_internal_predicateoutput_0 = '1' THEN 
            is_control_next <= IN_write_top;
            -- variables
            IF dma_tready = '1' THEN 
              read_flag_next <= '1';
            END IF;
            -- outputs
            add_temp_7 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
            IF (add_temp_7(17) = '0') AND (add_temp_7(16 DOWNTO 15) /= "00") THEN 
              addr_reg_temp := X"7FFF";
            ELSIF (add_temp_7(17) = '1') AND (add_temp_7(16 DOWNTO 15) /= "11") THEN 
              addr_reg_temp := X"8000";
            ELSE 
              addr_reg_temp := add_temp_7(15 DOWNTO 0);
            END IF;
            wr_en_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          ELSE 
            -- variables
            IF dma_tready = '1' THEN 
              read_flag_next <= '1';
            END IF;
            -- outputs
            add_temp_6 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
            IF (add_temp_6(17) = '0') AND (add_temp_6(16 DOWNTO 15) /= "00") THEN 
              addr_reg_temp := X"7FFF";
            ELSIF (add_temp_6(17) = '1') AND (add_temp_6(16 DOWNTO 15) /= "11") THEN 
              addr_reg_temp := X"8000";
            ELSE 
              addr_reg_temp := add_temp_6(15 DOWNTO 0);
            END IF;
            wr_en_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          END IF;
        END IF;
      WHEN OTHERS => 
        --case IN_write_top:
        IF ( NOT tvalid) = '1' THEN 
          is_control_next <= IN_idle;
          -- variables
          IF dma_tready = '1' THEN 
            read_flag_next <= '1';
          END IF;
          -- outputs
          wr_en_reg_next <= '0';
          out_tvalid_reg_next <= '0';
        ELSE 
          sf_internal_predicateoutput_4 := hdlcoder_to_stdlogic((tvalid AND hdlcoder_to_stdlogic(addr_reg = to_signed(16#003F#, 16))) = '1');
          IF sf_internal_predicateoutput_4 = '1' THEN 
            is_control_next <= IN_write_bottom;
            -- variables
            IF dma_tready = '1' THEN 
              read_flag_next <= '1';
            END IF;
            -- outputs
            addr_reg_temp := to_signed(16#0000#, 16);
            wr_en_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          ELSE 
            -- variables
            IF dma_tready = '1' THEN 
              read_flag_next <= '1';
            END IF;
            -- outputs
            add_temp_4 := resize(addr_reg, 18) + to_signed(16#00001#, 18);
            IF (add_temp_4(17) = '0') AND (add_temp_4(16 DOWNTO 15) /= "00") THEN 
              addr_reg_temp := X"7FFF";
            ELSIF (add_temp_4(17) = '1') AND (add_temp_4(16 DOWNTO 15) /= "11") THEN 
              addr_reg_temp := X"8000";
            ELSE 
              addr_reg_temp := add_temp_4(15 DOWNTO 0);
            END IF;
            wr_en_reg_next <= '1';
            out_tvalid_reg_next <= '0';
          END IF;
        END IF;
    END CASE;
    IF guard1 = '1' THEN 
      is_control_next <= IN_write_bottom;
      -- variables
      IF dma_tready = '1' THEN 
        read_flag_next <= '1';
      END IF;
      -- outputs
      add_temp_8 := resize(addr_reg_temp, 18) + to_signed(16#00001#, 18);
      IF (add_temp_8(17) = '0') AND (add_temp_8(16 DOWNTO 15) /= "00") THEN 
        addr_reg_temp := X"7FFF";
      ELSIF (add_temp_8(17) = '1') AND (add_temp_8(16 DOWNTO 15) /= "11") THEN 
        addr_reg_temp := X"8000";
      ELSE 
        addr_reg_temp := add_temp_8(15 DOWNTO 0);
      END IF;
      wr_en_reg_next <= '1';
      out_tvalid_reg_next <= '0';
    END IF;
    addr_reg_next <= addr_reg_temp;
  END PROCESS control_output;

  addr_tmp <= addr_reg_next;
  wr_en <= wr_en_reg_next;
  out_tvalid <= out_tvalid_reg_next;

  addr <= std_logic_vector(addr_tmp);

END rtl;

