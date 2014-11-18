xpts=10;
told=0;
% % v=[1.7 0.7
% %     1.7 0.7
% %     2 0
% %     -3 0
% %     0 0];
% % for i1=-2:0.2:2
% %     for i2=-2:0.2:2
% %         for i3=-2:0.2:2
% %             for i4=-2:0.2:2
%                 for i5=-2:0.2:2
%                     for i6=-2:0.2:2
%                         v=[i5,0;i6,0;0,0];%v=[i1,i2;i3,i4;i5,0;i6,0;0,0];
%                         tnew=testfitness(xpts,v);
%                         if tnew>told
%                             told=tnew
%                             w=v;
%                         end
%                     end
%                 end
% %             end
% %         end
% %     end
% % end
% told
% w
i5=w(1,1);
i6=w(2,1);
for i1=-2:0.2:2
    for i2=-2:0.2:2
        for i3=-2:0.2:2
            for i4=-2:0.2:2
                v=[i1,i2;i3,i4;i5,0;i6,0;0,0];
                tnew=testfitness(xpts,v);
                if tnew>told
                    told=tnew
                    w=v;
                end
            end
        end
    end
end   
told
w