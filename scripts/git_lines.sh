if [ $# -ne 2 ]
then
    echo 'Usage $0 REPO_DIR USER_NAME'
fi

cd $1

line_total=0
for commit in $(git log --oneline --author=$2 --all | awk '{print $1}')
do
    line_one=$(git show $commit --ignore-blank-lines --ignore-all-space  | grep -E '^\+.*'| wc -l)
    line_total=$( expr $line_total + $line_one )
done

echo $line_total


































































	       
