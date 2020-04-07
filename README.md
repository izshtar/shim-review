This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
UOS(https://chinauos.com)

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
UOS GNU/Linux

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
UOS is a linux distribution based on Debian, which need running normally in secure-boot-enable status on any AMD64 device, 
through which to avoid the hidden danger when customer disable secure boot.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: ZhangShuang
- Position: Sernior Director
- Email address: zhuangshuang@uniontech.com

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: ZhangYueQian
- Position: Sernior Developer
- Email address: zhangyueqian@uniontech.com

-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/release/tag/15 

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/rhboot/shim/release/tag/15

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
* patches/gcc-9-fix.patch:
  - Fix "address of packed member" compilation error with GGC 9 
    from pull request https://github.com/rhboot/shim/pull/183

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
-------------------------------------------------------------------------------
We recommend reproducing the binary by way of using the supplied Dockerfile:

`docker build .`

The binary is built on Debian unstable as of 2020-04-07.

Versions used can be found in the build logs.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
shim-15.g51413d1-7_amd64.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
N/A
