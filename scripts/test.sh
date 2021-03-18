function test {
echo "=== test module ===="
# test module loaded
curl -v http://localhost/test
echo "==== test function ===="
# test your function
curl -vk https://localhost/njs
}
