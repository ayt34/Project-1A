// Gmsh project created on Sun Feb 23 15:55:44 2025
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 0.1};
//+
Point(2) = {10, 0, 0, 1.0};
//+
Line(1) = {1, 2};
//+
Physical Point("'boundary'", 2) = {2};
//+
Physical Curve("'reservoir'", 3) = {1};
