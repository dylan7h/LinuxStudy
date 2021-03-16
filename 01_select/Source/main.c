#include <stdio.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>

#include <stdio.h>
#include "main.h"

#define TIMEOUT 5       /* 5 [sec] */
#define BUF_LEN 1024    /* size of read buffer(unit: byte) */

int main(void)
{
    struct timeval tv;
    fd_set readfs;
    int ret = 1, result;

    /* Wait Input From Standard Input */
    FD_ZERO(&readfs);
    FD_SET(STDIN_FILENO, &readfs);

    /* Set Timeout Variable */
    tv.tv_sec   = 5;
    tv.tv_usec  = 0;

    /* Wait Standard Input For 5 second */
    result = select(STDIN_FILENO + 1, &readfs, NULL, NULL, &tv);
    if(result == -1)
    {
        /*
            errno:
                EBADE   - Invalid File Descriptor
                EINTR   - A signal occurred while waiting.
                EINVAL  - Invalid Timeout Value
                ENOMEM  - Not enough memory
         */
        
        perror("select");
        ret = 1;
    }
    else if(result == 0)
    {
        printf("Timeout: %d [sec] elapsed.\n", TIMEOUT);
        ret = 1;
    }
    else
    {
        result = FD_ISSET(STDIN_FILENO, &readfs);
        if(result != 0)
        {
            char buf[BUF_LEN + 1];
            int len;

            /* Non-Blocking */
            len = read(STDIN_FILENO, buf, BUF_LEN);
            if(len == -1)
            {
                perror("read error");
                ret = 1;
            }
            
            if(len > 0)
            {
                buf[len] = '\0';
                printf("read: %s\n", buf);
                ret = 0;
            }
        }
    }

    return 0;
}
