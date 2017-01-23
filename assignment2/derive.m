function [ derivative ] = derive( function_handle, x_values, h )
%Calculate the derivative of "function_handle" on "x" when the delta x(=h) is
%"h"
%   Input Parameters
%       function_handle : target function
%       x_values : point of target function where derivative is calculated
%       h : delta x
%   Output Parameters
%       derivative : the derivative value of the target function on
%       "x_values"
derivative = (function_handle(x_values + h) - function_handle(x_values)) / h;
end

