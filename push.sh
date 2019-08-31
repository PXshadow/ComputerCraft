echo "Pushing data to server..."

git add . 
git commit -m "bash commit"
git push -u origin master

echo
echo -n "Press ENTER to close."

read userIn