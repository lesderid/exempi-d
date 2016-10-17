/*
 * exempi-d - exempi.xmpconsts
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

module exempi.xmpconsts;

extern(C):

//HACK: Should use a proper translation for 'extern const char CONSTANT_NAME[];'

extern __gshared const char[64] NS_XMP_META;
extern __gshared const char[64] NS_RDF;
extern __gshared const char[64] NS_EXIF;
extern __gshared const char[64] NS_TIFF;
extern __gshared const char[64] NS_XAP;
extern __gshared const char[64] NS_XAP_RIGHTS;
extern __gshared const char[64] NS_DC;
extern __gshared const char[64] NS_EXIF_AUX;
extern __gshared const char[64] NS_CRS;
extern __gshared const char[64] NS_LIGHTROOM;
extern __gshared const char[64] NS_PHOTOSHOP;
extern __gshared const char[64] NS_CAMERA_RAW_SETTINGS;
extern __gshared const char[64] NS_CAMERA_RAW_SAVED_SETTINGS;
extern __gshared const char[64] NS_IPTC4XMP;
extern __gshared const char[64] NS_TPG;
extern __gshared const char[64] NS_DIMENSIONS_TYPE;
/** Creative Commons namespace */
extern __gshared const char[64] NS_CC;
/* Added in Exempi 2.1 */
extern __gshared const char[64] NS_PDF;
