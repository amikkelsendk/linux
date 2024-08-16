# Find string in files - read all files under each directory, recursively
grep -R "horizon_ppol.py" .

# Replace CrLf with Lf
sed -i 's/\r/\n/g; s/\n$//'


# Uvicorn
uvicorn public.api:public --host 0.0.0.0 --port 8000 & uvicorn public.internal:internal --host 0.0.0.0 --port 8001

# .venv
cd "folder"
source .venv/bin/activate
deactivate

# Processes
# https://phoenixnap.com/kb/how-to-kill-a-process-in-linux
ps -e
# or
pgrep uvicorn -l
sudo killall uvicorn

# Install RDP on Ubuntu
# https://phoenixnap.com/kb/xrdp-ubuntu
apt-get install xrdp
