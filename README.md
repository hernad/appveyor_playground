#  Appveyor harbour application playground

## Status

[![Build status](https://ci.appveyor.com/api/projects/status/vkq9yeqm7ovbjvxf?svg=true)](https://ci.appveyor.com/project/hernad/appveyor-playground)

## Appveyor build

To trigger build git commit messages must contain "BUILD_RELEASE"

example:
<pre>
$ git commit -am "BUILD_RELEASE 2.0.0"
[master afe29b9] BUILD_RELEASE 2.0.0
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git tag 2.0.0

$ git push origin --tags
Counting objects: 3, done.
</pre>


## Notes

- https://www.appveyor.com/docs/environment-variables/
- https://github.com/scivision/pymap3d/blob/master/.appveyor.yml
- https://www.appveyor.com/docs/getting-started-with-appveyor-for-linux/ - CI_WINDOWS, CI_LINUX 
- https://stefanscherer.github.io/setup-windows-docker-ci-appveyor/
- http://conan-docs.readthedocs.io/en/feature-cmake-toolchain-file/integrations/appveyor.html

