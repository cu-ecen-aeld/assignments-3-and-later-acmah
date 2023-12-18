#include <syslog.h>
#include <stddef.h>
#include <stdio.h>


int main(int argc, char *argv[])
{
    openlog(NULL, 0, LOG_USER);

    if (argc < 3)
    {
        syslog(LOG_ERR, "Not enough arguments");
        return 1;
    }

    char *writeFile = argv[1];
    char *writeStr = argv[2];

    if (writeFile[0] == '\0')
    {
        syslog(LOG_ERR, "Write file is empty");
        return 1;
    }
    if (writeStr[0] == '\0')
    {
        syslog(LOG_ERR, "Write str is empty");
        return 1;
    }
    printf("%s\n", writeFile);
    FILE *file = fopen(writeFile, "a");
    if (NULL != file)
    {

        syslog(LOG_DEBUG, "Writing %s to %s", writeStr, writeFile);
        printf("Writing %s to %s\n", writeStr, writeFile);
        fprintf(file, "%s", writeStr);
        fclose(file);
        printf("wrote\n");
    }
    else
    {
        syslog(LOG_ERR, "Failed to open file");
        printf("failed\n");
        return 1;
    }

    return 0;
}