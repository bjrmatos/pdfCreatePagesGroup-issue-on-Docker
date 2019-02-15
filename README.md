# Issues on Docker: pdfCreatePagesGroup
The problem is the following: if this jsreport project is on Docker, the pdfCreatePagesGroup and pdfAddPageItem doesn't works.
Note that if this repository is lunched on local (using `npm install` and `node server.js`) everything works fine.

### How to replicate:

1. Download the repository
2. Build docker image: `docker build -t mergingbug . `
3. Run docker image, for example: `docker run --name testbug --rm -p 3500:3001 mergingbug`

4. On jsreport application, run the Main report. This one will try to create groups, used for header. Code is the same on https://playground.jsreport.net/w/admin/Wy6stA8t 
5. Here is the bug: When the header try to use groups, those are null or empty. pdf.groups are created, but doesn't have any data.

