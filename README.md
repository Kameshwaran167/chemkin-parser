GNU Octave, version 4.0.0
Copyright (C) 2015 John W. Eaton and others.
This is free software; see the source code for copying conditions.
There is ABSOLUTELY NO WARRANTY; not even for 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
For any help, visit http://www.octave.org

This script parses the NASA Polynomial format for CHEMKIN-II

Note: Any usage of this script assumes the following (not limited to)

1. Thermodynamic properties obtained are only for species in GASEOUS Phase.
2. Supplied temperature of the gas is in Kelvin.
3. The units of enthalpy(H),entropy(S),heat capacity(Cp) are 
   cal/mol , cal/mol-K, cal/mol-K
4. Plots are drawn only within the effective range



This script can be used as a stand alone code. However, if needed it can be verified with standard properties of air by using another script.
