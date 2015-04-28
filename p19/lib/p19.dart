// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p19 library.
library p19;

bool isSunday(int year, int month){
  DateTime d = new DateTime(year, month, 1);
  return d.weekday == DateTime.SUNDAY;
}