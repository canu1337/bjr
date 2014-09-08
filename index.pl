#!/usr/bin/perl

#The bestest shit right there
use HTML::Template;

# open the html template
my $template = HTML::Template->new(filename => 'Germain.tmpl');

#Let's get some info about the current time.  
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
  
#Which image are we going to use today?
my $selected_image;
my $file;
my @images;
  
#Let's parse the folder.
opendir(DIR, './images/GERMAIN') or die "Can't open the content directory: $!";

while (defined($file = readdir(DIR))) 	
	{ push(@images, $file); }
	
my $chaika = scalar @images; #The total number of images available.

#The selected image is the current day (0-365) modulus the total number of images.
my $index = $yday % $chaika;
	
# Add the image path we got
$template->param(IMAGE => "./images/GERMAIN/".$images[$index]);

# send the obligatory Content-Type and print the template output
print "Content-Type: text/html\n\n", $template->output;  
  