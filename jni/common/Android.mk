# Android.mk
#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


LOCAL_PATH:= $(call my-dir)

#
# Common definitions.
#

src_files := \
	../../Android-sqlite-native-driver/native/sqlc_all.c

src_files += \
	cmemory.c          cstring.c          \
	cwchar.c           locmap.c           \
	punycode.c         putil.c            \
	uarrsort.c         ubidi.c            \
	ubidiln.c          ubidi_props.c      \
	ubidiwrt.c         ucase.c            \
	ucasemap.c         ucat.c             \
	uchar.c            ucln_cmn.c         \
	ucmndata.c         icudt44l_dat.s     \
	ucnv2022.c         ucnv_bld.c         \
	ucnvbocu.c         ucnv.c             \
	ucnv_cb.c          ucnv_cnv.c         \
	ucnvdisp.c         ucnv_err.c         \
	ucnv_ext.c         ucnvhz.c           \
	ucnv_io.c          ucnvisci.c         \
	ucnvlat1.c         ucnv_lmb.c         \
	ucnvmbcs.c         ucnvscsu.c         \
	ucnv_set.c         ucnv_u16.c         \
	ucnv_u32.c         ucnv_u7.c          \
	ucnv_u8.c                             \
	udata.c            udatamem.c         \
	udataswp.c         uenum.c            \
	uhash.c            uinit.c            \
	uinvchar.c         uloc.c             \
	umapfile.c         umath.c            \
	umutex.c           unames.c           \
	unorm_it.c         uresbund.c         \
	ures_cnv.c         uresdata.c         \
	usc_impl.c         uscript.c          \
	ushape.c           ustrcase.c         \
	ustr_cnv.c         ustrfmt.c          \
	ustring.c          ustrtrns.c         \
	ustr_wcs.c         utf_impl.c         \
	utrace.c           utrie.c            \
 	utypes.c           wintz.c            \
 	utrie2_builder.c   icuplug.c          \
 	propsvec.c         ulist.c            \
 	uloc_tag.c

src_files += \
        bmpset.cpp      unisetspan.cpp   \
	brkeng.cpp      brkiter.cpp      \
	caniter.cpp     chariter.cpp     \
	dictbe.cpp      locbased.cpp     \
	locid.cpp       locutil.cpp      \
	normlzr.cpp     parsepos.cpp     \
	propname.cpp    rbbi.cpp         \
	rbbidata.cpp    rbbinode.cpp     \
	rbbirb.cpp      rbbiscan.cpp     \
	rbbisetb.cpp    rbbistbl.cpp     \
	rbbitblb.cpp    resbund_cnv.cpp  \
	resbund.cpp     ruleiter.cpp     \
	schriter.cpp    serv.cpp         \
	servlk.cpp      servlkf.cpp      \
	servls.cpp      servnotf.cpp     \
	servrbf.cpp     servslkf.cpp     \
	triedict.cpp    ubrk.cpp         \
	uchriter.cpp    uhash_us.cpp     \
	uidna.cpp       uiter.cpp        \
	unifilt.cpp     unifunct.cpp     \
	uniset.cpp      uniset_props.cpp \
	unistr_case.cpp unistr_cnv.cpp   \
	unistr.cpp      unistr_props.cpp \
	unormcmp.cpp    unorm.cpp        \
	uobject.cpp     uset.cpp         \
	usetiter.cpp    uset_props.cpp   \
	usprep.cpp      ustack.cpp       \
	ustrenum.cpp    utext.cpp        \
	util.cpp        util_props.cpp   \
	uvector.cpp     uvectr32.cpp     \
	errorcode.cpp                    \
	bytestream.cpp  stringpiece.cpp  \
	mutex.cpp       dtintrv.cpp      \
	ucnvsel.cpp     uvectr64.cpp     \
	locavailable.cpp         locdispnames.cpp   \
	loclikely.cpp            locresdata.cpp     \
	normalizer2impl.cpp      normalizer2.cpp    \
	filterednormalizer2.cpp  ucol_swp.cpp       \
	uprops.cpp      utrie2.cpp

src_files += \
	bocsu.c     ucln_in.c  decContext.c \
	ulocdata.c  utmscale.c decNumber.c

src_files += \
        indiancal.cpp   dtptngen.cpp dtrule.cpp   \
        persncal.cpp    rbtz.cpp     reldtfmt.cpp \
        taiwncal.cpp    tzrule.cpp   tztrans.cpp  \
        udatpg.cpp      vtzone.cpp                \
	anytrans.cpp    astro.cpp    buddhcal.cpp \
	basictz.cpp     calendar.cpp casetrn.cpp  \
	choicfmt.cpp    coleitr.cpp  coll.cpp     \
	cpdtrans.cpp    csdetect.cpp csmatch.cpp  \
	csr2022.cpp     csrecog.cpp  csrmbcs.cpp  \
	csrsbcs.cpp     csrucode.cpp csrutf8.cpp  \
	curramt.cpp     currfmt.cpp  currunit.cpp \
	datefmt.cpp     dcfmtsym.cpp decimfmt.cpp \
	digitlst.cpp    dtfmtsym.cpp esctrn.cpp   \
	fmtable_cnv.cpp fmtable.cpp  format.cpp   \
	funcrepl.cpp    gregocal.cpp gregoimp.cpp \
	hebrwcal.cpp    inputext.cpp islamcal.cpp \
	japancal.cpp    measfmt.cpp  measure.cpp  \
	msgfmt.cpp      name2uni.cpp nfrs.cpp     \
	nfrule.cpp      nfsubs.cpp   nortrans.cpp \
	nultrans.cpp    numfmt.cpp   olsontz.cpp  \
	quant.cpp       rbnf.cpp     rbt.cpp      \
	rbt_data.cpp    rbt_pars.cpp rbt_rule.cpp \
	rbt_set.cpp     regexcmp.cpp regexst.cpp  \
	rematch.cpp     remtrans.cpp repattrn.cpp \
	search.cpp      simpletz.cpp smpdtfmt.cpp \
	sortkey.cpp     strmatch.cpp strrepl.cpp  \
	stsearch.cpp    tblcoll.cpp  timezone.cpp \
	titletrn.cpp    tolowtrn.cpp toupptrn.cpp \
	translit.cpp    transreg.cpp tridpars.cpp \
	ucal.cpp        ucol_bld.cpp ucol_cnt.cpp \
	ucol.cpp        ucoleitr.cpp ucol_elm.cpp \
	ucol_res.cpp    ucol_sit.cpp ucol_tok.cpp \
	ucsdet.cpp      ucurr.cpp    udat.cpp     \
	umsg.cpp        unesctrn.cpp uni2name.cpp \
	unum.cpp        uregexc.cpp  uregex.cpp   \
	usearch.cpp     utrans.cpp   windtfmt.cpp \
 	winnmfmt.cpp    zonemeta.cpp zstrfmt.cpp  \
 	numsys.cpp      chnsecal.cpp \
 	cecal.cpp       coptccal.cpp ethpccal.cpp \
 	brktrans.cpp    wintzimpl.cpp plurrule.cpp \
 	plurfmt.cpp     dtitvfmt.cpp dtitvinf.cpp \
 	tmunit.cpp      tmutamt.cpp  tmutfmt.cpp  \
 	colldata.cpp    bmsearch.cpp bms.cpp      \
        currpinf.cpp    uspoof.cpp   uspoof_impl.cpp \
        uspoof_build.cpp     \
        regextxt.cpp    selfmt.cpp   uspoof_conf.cpp \
        uspoof_wsconf.cpp ztrans.cpp zrule.cpp  \
        vzone.cpp       fphdlimp.cpp fpositer.cpp\
        locdspnm.cpp    decnumstr.cpp ucol_wgt.cpp

c_includes := \
	$(LOCAL_PATH)

# We make the ICU data directory relative to $ANDROID_ROOT on Android, so both
# device and sim builds can use the same codepath, and it's hard to break one
# without noticing because the other still works.
local_cflags := '-DICU_DATA_DIR_PREFIX_ENV_VAR="ANDROID_ROOT"'
local_cflags += '-DICU_DATA_DIR="/usr/icu"'

local_cflags += -D_REENTRANT -DU_COMMON_IMPLEMENTATION -O3 -DU_I18N_IMPLEMENTATION
local_ldlibs := -lm -llog


#
# Build for the target (device).
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(src_files)
LOCAL_C_INCLUDES := $(c_includes)
LOCAL_C_INCLUDES += ../../Android-sqlite-native-driver
LOCAL_C_INCLUDES += ../../sqlite-amalgamation
LOCAL_CFLAGS := $(local_cflags) -DPIC -fPIC -DANDROID_NDK -Dfdatasync=fsync
LOCAL_CFLAGS += -DSQLITE_ENABLE_ICU
LOCAL_CFLAGS += -DSQLITE_TEMP_STORE=2 -DSQLITE_THREADSAFE=2
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS3 -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_RTREE
LOCAL_LDLIBS += $(local_ldlibs)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := sqlc-native-driver
include $(BUILD_SHARED_LIBRARY)
