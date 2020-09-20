--  Inference in synthesis.
--  Copyright (C) 2017 Tristan Gingold
--
--  This file is part of GHDL.
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
--  MA 02110-1301, USA.

with Netlists; use Netlists;
with Netlists.Builders; use Netlists.Builders;
with Synth.Source;

package Netlists.Inference is
   --  Walk the And-net N, and extract clock (posedge/negedge) if found.
   --  ENABLE is N without the clock.
   --  If not found, CLK and ENABLE are set to No_Net.
   procedure Extract_Clock
     (Ctxt : Context_Acc; N : Net; Clk : out Net; Enable : out Net);

   --  To be called when there is an assignment to a signal/output of VAL and
   --  the previous value is PREV_VAL (an Id_Signal or Id_Output).
   --  If there is a loop, infere a dff or a latch or emit an error.
   --  LAST_USE is true iff PREV_VAL won't be reused anywhere else.  So, if
   --   PREV_VAL is only used in VAL, this is a closed logic that could be
   --   ignored.
   function Infere (Ctxt : Context_Acc;
                    Val : Net;
                    Off : Uns32;
                    Prev_Val : Net;
                    Stmt : Synth.Source.Syn_Src;
                    Last_Use : Boolean) return Net;

   --  Called when there is an assignment to a enable gate.
   function Infere_Assert (Ctxt : Context_Acc;
                           Val : Net;
                           En_Gate : Net;
                           Stmt : Synth.Source.Syn_Src) return Net;
end Netlists.Inference;
