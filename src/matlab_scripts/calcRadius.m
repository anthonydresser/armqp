%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%% calcRadius.m
% Does catmul rom spline function for barrel projection
% outputs a new radius, newr based on the current radius, pr, and the maximum rMax

function [ newr ] = calcRadius( pr, rMax )

K = [1.00300002 1.01999998 1.04200006 1.06599998 1.09399998 1.12600005 1.16199994 1.20299995  1.25000000 1.30999994 1.38000000];
NumSegments = 11;
scaledRsq = 10 * power(pr, 2)/power(rMax, 2);
myfloor = floor(scaledRsq);
myfloor = max(0.0, min(myfloor, 10));
t = scaledRsq - myfloor;
k = floor(myfloor);

switch k
    case 0
        p0 = 1.0;
        m0 =( K(1+1) - K(0+1) );
        p1 = K(1+1);
        m1 = 0.5 * ( K(2+1) - K(0+1) );
    case NumSegments-2
        p0 = K(NumSegments-2+1);
        m0 = 0.5 * ( K(NumSegments-1+1) - K(NumSegments-2+1) );
        p1 = K(NumSegments-1+1);
        m1 = K(NumSegments-1+1) - K(NumSegments-2+1);
    case NumSegments-1
        p0 = K(NumSegments-1+1);
        m0 = K(NumSegments-1+1) - K(NumSegments-2+1);
        p1 = p0 + m0;
        m1 = m0;
    otherwise
        p0 = K(k+1);
        m0 = 0.5 * ( K(k+1+1) - K(k-1+1) );
        p1 = K(k+1+1);
        m1 = 0.5 * ( K(k+2+1) - K(k+1) );
end
omt=1-t;
res  = ( p0 * ( 1.0 + 2.0 *   t ) + m0 *   t ) * omt * omt + ( p1 * ( 1.0 + 2.0 * omt ) - m1 * omt ) *   t *   t;

newr=res * pr;

end

