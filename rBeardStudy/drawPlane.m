function handle = drawPlane( pn, pe, pd, phi, theta, psi,...
                              p, q, r, sim_time, handle, mode )
%DRAWPLANE draw the aircraft, performing the transformation as specified
% by the args   
    %TODO: use rates
   
    % define persistent variables 
    persistent vehicle_handle;
    persistent Verts;
    persistent Faces;
    persistent FaceColors;
    
    if sim_time == 0,
        figure(1);
        clf;

        [Verts, Faces, FaceColors] = planeVFC();
        vehicle_handle = doDraw(Verts,Faces,FaceColors,...
                                pn,pe,pd,phi,theta,psi,[]);
                            
        title('Vehicle')
        xlabel('East')
        ylabel('North')
        zlabel('-Down')
        %view(32,47)  % set the view angle for figure
        axis([-15,15,-15,15,-15,15]);
        hold on
    else
        drawVehicleBody(Verts,Faces,FaceColors,...
                           pn,pe,pd,phi,theta,psi,...
                           vehicle_handle);
    end    
end

function handle = doDraw(V, F, patchColors,...
                       pn,pe,pd,phi,theta,psi,handle)
    %tranformations
                   %roll, pitch, yaw
    V = rotate(V, phi, theta, psi);
                   %north, east, down
    V = translate(V, pn, pe, pd);
                   %roll rate, pitch rate, yaw rate       
        
    %transform from NED to XYZ (for matlab rendering)    
    R = [0, 1, 0;...
         1, 0, 0;...
         0, 0, -1; ];
    V = V*R;
    
    if isempty(handle),
        handle = patch('Vertices', V, 'Faces', F,...
                       'FaceVertexCData', patchColors,...
                       'FaceColor', 'flat');
    else
        set(handle,'Vertices',V,'Faces',F);
        drawnow;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%
function pts = rotate(pts,phi,theta,psi)

  % define rotation matrix (right handed)
  R_roll = [...
          1, 0, 0;...
          0, cos(phi), sin(phi);...
          0, -sin(phi), cos(phi)];
  R_pitch = [...
          cos(theta), 0, -sin(theta);...
          0, 1, 0;...
          sin(theta), 0, cos(theta)];
  R_yaw = [...
          cos(psi), sin(psi), 0;...
          -sin(psi), cos(psi), 0;...
          0, 0, 1];
  R = R_roll*R_pitch*R_yaw;  
    % note that R above either leaves the vector alone or rotates
    % a vector in a left handed rotation.  We want to rotate all
    % points in a right handed rotation, so we must transpose
  R = R';

  % rotate vertices
  pts = pts*R;
  
end
% end rotateVert

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% translate vertices by pn, pe, pd
function pts = translate(pts,pn,pe,pd)
 
  %pts = pts + repmat([pn;pe;pd],1,size(pts,2));
  pts = pts + repmat([pn,pe,pd;],size(pts,1),1);
  
end
% end translate
