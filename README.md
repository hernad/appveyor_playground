# Appveyor build

- commit messages must contain "BUILD_RELEASE"

- example:

<pre>
$ git commit -am "BUILD_RELEASE 2.0.0"
[master afe29b9] BUILD_RELEASE 2.0.0
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git tag 2.0.0

$ git push origin --tags
Counting objects: 3, done.
</pre>
