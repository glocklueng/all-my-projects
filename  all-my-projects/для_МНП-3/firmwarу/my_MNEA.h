#ifndef _MY_MNEA_H
#define	_MY_MNEA_H

#ifdef	__cplusplus
extern "C" {
#endif

#ifdef	__cplusplus
}
#endif

#endif	/* _MY_MNEA_H */


// ��������� ������������ ��������
#define MNP_WAIT_START                  0
#define MNP_GET_CRC_H                   1
#define MNP_GET_CRC_L                   2
#define MNP_GET_CR                      3
#define MNP_GET_LF                      4
#define MNP_WAIT_CRC_L                  5
#define MNP_GET_DATA                    6


// ������ ������ ��� ���������
#define	 MNP_MESSAGE_BUFFER_SIZE        64

//���� ������ ������������ ��������
#define ERR_RX_EMPTY                            -1 // ����� ������
#define ERR_RX_OVERFLOW                         -2 //������������ ��������� ������
#define ERR_MNP_MESSAGE_OVERFLOW                -3 //������������ ������ ���������
#define ERR_MNP_START_EXPECTED                  -4 // ��������� ������ ������, � ������ ���-�� ������
#define ERR_MNP_START_UNEXPECTED                -5 // ����������� ������ ������ ���������
#define ERR_MNP_END_UNEXPECTED                  -6 // ����������� ����� ���������.
#define ERR_MNP_LF_UNEXPECTED                   -7// � ������ ������ ���������� ������� ������
#define ERR_MNP_CR_UNEXPECTED                   -8// � ������ ������ ���������� ������� �������
#define ERR_MNP_UNEXPECTED_CRC_CHAR             -9// � ���� CRC ���������� ����������� ������
#define ERR_MNP_CR_EXPECTED                     -10// ������ ��� ������ ������� �������
#define ERR_MNP_LF_EXPECTED                     -11 // ������ ��� ������ ������� ������
#define ERR_MNP_CRC_ERROR                       -12// CRC �� �������


#define PPER_command    "PIPER,0" // ������� ����������� ���3
#define GLRMS_message   "GLRMC"
#define GPRMS_message   "GLRMC"
#define GNRMS_message   "GNRMC"

// ������ ������
#define GL_only         1
#define GP_only         2
#define GL_and_GP       3

char MNP_get_message(void); // ��������� ���������
void MNP_message_reset (void); // ��������� ����������� �������

char MNP_send_message(void);//char* str); // ���������� ���������

char MNP_message_parser(void);
char MNP_RMS_message_parser(void);
char* MNP_get_param(char par_num);
//char str_in_str(char *str1, char *str2, char len);
char str_in_str(void);


unsigned char step;