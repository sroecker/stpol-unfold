CC=g++
CXXFLAGS= -Wall -O2 -g -I./tunfold  `root-config --cflags --libs`
LDFLAGS=-L./tunfold -Wl,-rpath=./tunfold -lunfold -lMinuit -lXMLParser

all: unfold unfold_pseudo unfold_systematics calc_asymmetry calc_asymmetry_syst closure unfold_pseudo2

unfold: unfold.cc info.h utils.hpp
unfold_pseudo: unfold_pseudo.cc info.h utils.hpp
unfold_pseudo2: unfold_pseudo2.cc info.h utils.hpp
unfold_systematics: unfold_systematics.cc info.h utils.hpp
unfold_scan_dice: unfold_scan_dice.cc unfold.hpp utils.hpp info.h

calc_asymmetry: calc_asymmetry.C info.h utils.hpp
calc_asymmetry_syst: calc_asymmetry_syst.C info.h utils.hpp

closure: closure.C info.h utils.hpp

clean:
	rm unfold unfold_pseudo calc_asymmetry unfold_systematics calc_asymmetry_syst
