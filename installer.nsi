### ���尲װ�����ƺ����·��
Outfile "mineNotePad_Installer.exe"

### ���尲װĿ¼��Ĭ�� C:\\Program Files\\mineNotePad��
InstallDir "$PROGRAMFILES\mineNotePad"

### ��ȡĬ�ϰ�װĿ¼������û��Ѱ�װ����
InstallDirRegKey HKLM "Software\mineNotePad" "Install_Dir"

### ���ð�װҳ�棨���Э�顢���ѡ��ȣ�
Page directory
Page instfiles

### ���尲װ��
Section "Install"

    # ������װĿ¼
    SetOutPath "$INSTDIR"

    # ���ƿ�ִ���ļ�
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\mineNotePad.exe"
    
    # ���� Qt ������
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Qt6Core.dll"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Qt6Gui.dll"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Qt6Widgets.dll"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Qt6Network.dll"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Qt6PrintSupport.dll"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Qt6Svg.dll"
	File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\libgcc_s_seh-1.dll"
	File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\libstdc++-6.dll"
	File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\libwinpthread-1.dll"
	File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\opengl32sw.dll"
	File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\dxcompiler.dll"
	File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\D3Dcompiler_47.dll"
	
	
    # ���� Qt ������� imageformats, platforms, styles �ȣ�
    SetOutPath "$INSTDIR\platforms"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\platforms\qwindows.dll"
    
    SetOutPath "$INSTDIR\imageformats"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\imageformats\qjpeg.dll"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\imageformats\qsvg.dll"
    
    SetOutPath "$INSTDIR\styles"
    File "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\styles\qmodernwindowsstyle.dll"

    #���� Icon �ļ��У���������ͼ�꣩
    SetOutPath "$INSTDIR\Icon"
    ##File /r "D:\Documents\STUDY_4\build\Desktop_Qt_6_8_2_MinGW_64_bit-Release\release\Icon\*.*"
	
    # ע�ᰲװ·����ע�������ж�س���ʹ�ã�
    WriteRegStr HKLM "Software\mineNotePad" "Install_Dir" "$INSTDIR"
    
    # ���������ݷ�ʽ
    CreateShortCut "$DESKTOP\mineNotePad.lnk" "$INSTDIR\mineNotePad.exe"
    
    # ������ʼ�˵���ݷ�ʽ
    CreateDirectory "$SMPROGRAMS\mineNotePad"
    CreateShortCut "$SMPROGRAMS\mineNotePad\mineNotePad.lnk" "$INSTDIR\mineNotePad.exe"
    
    # ����ж�س���
    WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

### ����ж�ض�
Section "Uninstall"

    # 1. �ر������е� mineNotePad.exe������������У�
    ExecWait 'taskkill /F /IM mineNotePad.exe /T'  # ǿ�ƹرս��̼��ӽ���
    Sleep 1000  # �ȴ� 1 �룬ȷ�����̱����׹ر�

    # 2. �ٴμ������Ƿ������У���ʱ taskkill ����ʧ�ܣ�
    System::Call 'kernel32::OpenProcess(i 0x400, i 0, i $INSTDIR\mineNotePad.exe) i .r0'
    StrCmp $0 0 done  # ������̲����ڣ�����ɾ��

    # 3. ��������������У�����ʾ�û��ֶ��ر�
    MessageBox MB_OK "mineNotePad �������У����ȹرճ�����ټ���ж�ء�" 
    Abort  # ��ֹж��

done:
    # 4. ɾ�� exe �ļ�
    Delete "$INSTDIR\mineNotePad.exe"

    # 5. ɾ�������ļ�
    Delete "$INSTDIR\Qt6Core.dll"
    Delete "$INSTDIR\Qt6Gui.dll"
    Delete "$INSTDIR\Qt6Widgets.dll"
    Delete "$INSTDIR\Qt6Network.dll"
    Delete "$INSTDIR\Qt6PrintSupport.dll"
    Delete "$INSTDIR\Qt6Svg.dll"
    Delete "$INSTDIR\libgcc_s_seh-1.dll"
    Delete "$INSTDIR\libstdc++-6.dll"
    Delete "$INSTDIR\libwinpthread-1.dll"
    Delete "$INSTDIR\opengl32sw.dll"
    Delete "$INSTDIR\dxcompiler.dll"
    Delete "$INSTDIR\D3Dcompiler_47.dll"

    # 6. ɾ�� Qt ���Ŀ¼
    RMDir /r "$INSTDIR\platforms"
    RMDir /r "$INSTDIR\imageformats"
    RMDir /r "$INSTDIR\styles"
	### ɾ�� Icon Ŀ¼����������ͼ���ļ���
    RMDir /r "$INSTDIR\Icon"

    # 7. ɾ��ж�س���
    Delete "$INSTDIR\uninstall.exe"
	
	RMDir /r "$INSTDIR\Icon"

    # 8. ɾ����Ŀ¼��ȷ��Ϊ�գ�
    RMDir "$INSTDIR"

    # 9. ɾ����ݷ�ʽ
    Delete "$DESKTOP\mineNotePad.lnk"
    Delete "$SMPROGRAMS\mineNotePad\mineNotePad.lnk"
	

    RMDir "$SMPROGRAMS\mineNotePad"
	

    # 10. ɾ��ע�����Ϣ
    DeleteRegKey HKCU "Software\mineNotePad"

SectionEnd

