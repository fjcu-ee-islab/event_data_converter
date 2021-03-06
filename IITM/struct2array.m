function a = struct2array(s)
%STRUCT2ARRAY Convert structure with doubles to an array.

%   Author(s): R. Losada
%   Copyright 1988-2002 The MathWorks, Inc.
%   $Revision: 1.3.4.1 $  $Date: 2007/12/14 15:16:24 $

narginchk(1,1);

% Convert structure to cell
c = struct2cell(s);

% Construct an array
a = [c{:}];