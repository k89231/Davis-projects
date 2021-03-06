function [value,isterminal,direction] = eventfun(t,z)

% Detect zero angle
value = z(1);

% Stop simulation if angle and velocity are zero
if abs(z(2)) < 1e-4;
    isterminal = 1;
else 
    isterminal = 0;
end

% All directions
direction = 0;

% Display
% disp(['Event at t = ' num2str(t)]);
% disp(['Terminal = ' num2str(isterminal)]);