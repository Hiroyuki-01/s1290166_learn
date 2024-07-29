echo "Uninstall old Package version"
pip uninstall -y s1290166_learn

echo "Running setup"
python3 setup.py sdist bdist_wheel

echo "Uploading to test repository"
python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

echo "Wait for 5 minute to update the repository"
sleep 60

echo "installing Package from the testPYPI"
python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps s1290166_learn

echo "Uploading Package to main PYPI repository"
python3 -m twine upload dist/*

echo "Deleting unnecessary files"
rm -rf dist/ s1290166_learn.egg-info/ build/

echo "Completed."
