#include <unistd.h>
#include <poll.h>

#include <stdio.h>
#include "main.h"

#define TIMEOUT 5       /* 5 [sec] */

int main(void)
{
    struct pollfd fds[2];
    int ret = 1, result;

    /* Input Event */
    fds[0].fd        = STDIN_FILENO;
    fds[0].events    = POLLIN;

    /* Output Event(Almost true) */
    fds[1].fd        = STDOUT_FILENO;
    fds[1].events    = POLLOUT;

    /* Wait Event */
    result = poll(fds, 2, TIMEOUT * 1000);
    if(result == -1)
    {
        perror("poll");
        ret = 1;
    }
    else if(result == 0)
    {
        printf("Timeout: %d [sec] elapsed.\n", TIMEOUT);
        ret = 1;
    }
    else
    {
        if((fds[0].revents & POLLIN) == POLLIN)
        {
            printf("stdin readable\n");
        }

        if((fds[1].revents & POLLOUT) == POLLOUT)
        {
            printf("stdout writeable\n");
        }

        ret = 0;
    }

    return ret;
}
