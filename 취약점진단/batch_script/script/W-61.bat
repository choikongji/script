echo ^<W-61^> >> ../result.xml
echo ^<Name^> LAN Manager ���� ���� ^</Name^> >> ../result.xml
echo ^<Security_Threat^>>> ../result.xml
echo -�������� ���� LAN Manager ���� ������ ����ϴ� ��� ���� Ʈ������ >> ../result.xml
echo ����ä�⸦ ���� �������� ���� ���� ������ ����� �� ���� >> ../result.xml
echo ^</Security_Threat^>>> ../result.xml
echo ^<Data^> ^<^^![CDATA[ >> ../result.xml
echo #reg query "LmCompatibilityLevel" >> ../result.xml
echo. >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" >> ../result.xml
echo ]]^> ^</Data^> >> ../result.xml
echo ^<Comment^> >> ../result.xml
echo [��ȣ] : "LAN Manager ���� ����" ��å�� "NTLMv2 ���丸 ����"�� ���� �Ǿ� �ִ� ��� >> ../result.xml
echo [���] : "LAN Manager ���� ����" ��å�� "LM" �� "NTLM"������ �����Ǿ� �ִ� ��� >> ../result.xml
echo LmCompatibilityLevel 0x0 = LM �� NTLM ���� ������ >> ../result.xml
echo LmCompatibilityLevel 0x1 = LM �� NTLM ���� ������-����Ǹ� NTLMv2 ���� ���� ��� >> ../result.xml
echo LmCompatibilityLevel 0x2 = NTLM ���丸 ������ >> ../result.xml
echo LmCompatibilityLevel 0x3 = NTLMv2 ���丸 ������ >> ../result.xml
echo LmCompatibilityLevel 0x4 = NTLMv2 ���丸 ������ �� LM �ź� >> ../result.xml
echo LmCompatibilityLevel 0x5 = NTLMv2 ���丸 ������, LM �� NTLM �ź� >> ../result.xml
echo ^</Comment^> >> ../result.xml
echo ^<Result^> >> ../result.xml
reg query "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" | find "0x3" > nul
if !ERRORLEVEL! EQU 0 (
	echo [��ȣ] : "LAN Manager ���� ����" ��å�� "NTLMv2 ���丸 ����"�� ���� �Ǿ� �ִ� ��� >> ../result.xml
)else (
	echo [���] : "LAN Manager ���� ����" ��å�� "LM" �� "NTLM"������ �����Ǿ� �ִ� ��� >> ../result.xml
)
echo ^</Result^> >> ../result.xml
echo ^</W-61^> >> ../result.xml
echo. >> ../result.xml