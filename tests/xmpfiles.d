/*
 * exempi-d - tests/xmpfiles.d
 *
 * Bindings by Les De Ridder <les@lesderid.net>
 *
 * Copyright (C) 2007-2016 Hubert Figuiere
 * Copyright 2002-2007 Adobe Systems Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1 Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * 2 Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the
 * distribution.
 *
 * 3 Neither the name of the Authors, nor the names of its
 * contributors may be used to endorse or promote products derived
 * from this software wit hout specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

unittest
{
	import exempi.xmp;
	import exempi.xmpconsts;

	import std.string;

	enum sampleFile = "tests/samples/BlueSquare.jpg";

	assert(xmp_init());

	XmpFilePtr f = xmp_files_open_new(sampleFile.toStringz(), XmpOpenFileOptions.XMP_OPEN_READ);

	assert(f !is null);

	assert(xmp_files_check_file_format(sampleFile.toStringz()) == XmpFileType.XMP_FT_JPEG);

	XmpStringPtr file_path = xmp_string_new();
	XmpOpenFileOptions options;
	XmpFileType file_format;
	XmpFileFormatOptions handler_flags;
	assert(xmp_files_get_file_info(f, file_path, &options, &file_format,
			&handler_flags));
	assert(options == XmpOpenFileOptions.XMP_OPEN_READ);
	assert(file_format == XmpFileType.XMP_FT_JPEG);
	// the value check might break at each SDK update. You have been warned.
	assert(handler_flags == 0x27f);
	//assert(sampleFile.toStringz() == xmp_string_cstr(file_path));
	xmp_string_free(file_path);

	XmpPtr xmp = xmp_new_empty();

	assert(xmp !is null);

	assert(xmp_files_get_xmp(f, xmp));

	{
		XmpStringPtr thestring = xmp_string_new();
		XmpPacketInfo packet_info;
		assert(xmp_files_get_xmp_xmpstring(f, thestring, &packet_info));
		assert(packet_info.offset == 2189);
		assert(packet_info.length == 4782);
		assert(packet_info.padSize == 2049);
		assert(packet_info.hasWrapper);

		const char *xmp_str = xmp_string_cstr(thestring);
		assert(xmp_str);
		xmp_string_free(thestring);
	}

	XmpStringPtr the_prop = xmp_string_new();

	assert(
			xmp_get_property(xmp, NS_PHOTOSHOP.ptr, "ICCProfile", the_prop, null));
	assert("sRGB IEC61966-2.1" == fromStringz(xmp_string_cstr(the_prop)));

	xmp_string_free(the_prop);
	assert(xmp_free(xmp));

	assert(xmp_files_free(f));

	XmpFileFormatOptions formatOptions;

	// the value check might break at each SDK update. You have been warned.
	assert(xmp_files_get_format_info(XmpFileType.XMP_FT_JPEG, &formatOptions));
	assert(formatOptions == 0x27f);
	assert(xmp_files_get_format_info(XmpFileType.XMP_FT_GIF, &formatOptions));
	assert(formatOptions == 0x46b);
	assert(xmp_files_get_format_info(XmpFileType.XMP_FT_PNG, &formatOptions));
	assert(formatOptions == 0x46b);
	// PDF doesn't have a smart handler.
	assert(!xmp_files_get_format_info(XmpFileType.XMP_FT_PDF, &formatOptions));


	xmp_terminate();
}
