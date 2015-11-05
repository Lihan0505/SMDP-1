% policy_readable

% state
sizS=[2 3 3 10];
ind_lengthS=prod(sizS);
indices=1:ind_lengthS;
[u l m e] = ind2sub(sizS, indices);

u_table={'��Ļ��'; '��Ļ��'};
l_table={'��ǿ��' '��ǿ��' '��ǿǿ'};
m_table={'�ƶ���' '�ƶ���' '�ƶ���'};
e_table={'�����ȼ�1 ' '�����ȼ�2 ' '�����ȼ�3 ' '�����ȼ�4 ' '�����ȼ�5 ' '�����ȼ�6 ' '�����ȼ�7 ' '�����ȼ�8 ' '�����ȼ�9 ' '�����ȼ�10'};

%action
sizA=[3 5];
ind_lengthA=prod(sizA);
indices=1:ind_lengthA;
[a_display a_gps] = ind2sub(sizA, indices);

display_table={'����20% ' '����60% ' '����100%'};
gps_table={'GPS  1s' 'GPS  5s' 'GPS 10s' 'GPS 30s' 'GPS 60s'};

% write to the result.txt
fid = fopen('result2.txt','w');

for i=1:ind_lengthS
    fprintf(fid,'%d',i);
    fprintf(fid,'\t%s,%s,%s,%s',u_table{u(i)},l_table{l(i)},m_table{m(i)},e_table{e(i)});
    action=policy(i); 
    [disp gps]=ind2sub(sizA,action);
    fprintf(fid,'\t%s,%s\r\n',display_table{disp},gps_table{gps} );
end
fclose(fid);