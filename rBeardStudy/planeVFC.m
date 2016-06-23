function [ plane_verts, plane_faces, plane_colors ] = planeVFC(  )
%PLANEVFC Defines aircraft vertices, faces, and face colors.
% Coordinate frame is the body frame
% see page 26 of Baird's book for the diagram for this aircraft

% TODO: figure out how to generate these from something like Blender.

plane_verts = [...
    6,   0,   0.3;...      % point 1
    3,   1.5,   -1;...       % point 2
    3,   -1.5,  -1;...       % point 3 
    3,   -1.5,  1;...      % point 4
    3,   1.5,   1;...      % point 5
    -14, 0,   0;...       % point 6
    0,   10,  0;...       % point 7
    -5,  10,  0;...       % point 8
    -5,  -10, 0;...       % point 9
    0,   -10, 0;...       % point 10
    -10, 5,   0;...       % point 11
    -14, 5,   0;...       % point 12
    -14, -5,  0;...       % point 13
    -10, -5,  0;...       % point 14
    -10, 0,   0;...       % point 15
    -14, 0,   -4.0;...    % point 16
];

plane_faces = [...
    1,   3,   2;...       % nose top
    1,   4,   3;...       % nose left
    1,   2,   5;...       % nose right
    1,   4,   5;...       % nose bottom
    3,   2,   6;...       % fuselage top
    5,   4,   6;...       % fuselage bottom
    4,   6,   3;...       % fuselage left
    2,   6,   5;...       % fuselage right
    9,   8,   7;...       % wing top 1
    9,   7,   10;...      % wing top 2
    10,  7,   8;...       % wing bottom 1
    10,  8,   9;...       % wing bottom 2
    13,  12,  11;...      % tailwing top 1
    13,  11,  14;...      % tailwing top 2
    14,  11,  12;...      % tailwing bottom 1
    14,  12,  13;...      % tailwing bottom 2
    15,   6,  16;...      % tail left
    16,   6,  15;...      % tail right
];

red = [1, 0, 0];
blue = [0, 0, 1];
green = [0, 1, 0];
yellow = [1, 1, 0];

plane_colors = [...
   red;...         % nose top
   red;...         % nose left
   red;...         % nose right
   red;...         % nose bottom
   green;...        % fuselage top
   green;...        % fuselage bottom
   green;...        % fuselage left
   green;...        % fuselage right
   blue;...       % wing top 1
   blue;...       % wing top 2
   blue;...       % wing bottom 1
   blue;...       % wing bottom 2
   yellow;...      % tailwing top 1
   yellow;...      % tailwing top 2
   yellow;...      % tailwing bottom 1
   yellow;...      % tailwing bottom 2
   yellow;...      % tail left
   yellow;...      % tail right
];

end

