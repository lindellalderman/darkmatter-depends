from os.path import dirname, join
try:
	from setuptools import setup, Extension
except ImportError:
	from distutils.core import setup, Extension
	
# If you change the version here, also change it in jsonlib.c and .py.
version = '1.3.7'

setup (
	name = 'jsonlib',
	version = version,
	description = "JSON serializer/deserializer for Python",
	long_description = open (join (dirname (__file__), 'README.txt')).read (),
	author = "John Millikin",
	author_email = "jmillikin@gmail.com",
	license = "MIT",
	url = "https://launchpad.net/jsonlib",
	download_url = "http://cheeseshop.python.org/pypi/jsonlib/%s" % version,
	platforms = ["Platform Independent"],
	classifiers = [
		"Development Status :: 5 - Production/Stable",
		"Intended Audience :: Developers",
		"License :: OSI Approved :: MIT License",
		"Operating System :: OS Independent",
		"Programming Language :: Python",
		"Topic :: Software Development :: Libraries :: Python Modules",
	],
	keywords = ["json"],
	ext_modules = [
		Extension ('jsonlib', ['jsonlib.c']),
	],
)
