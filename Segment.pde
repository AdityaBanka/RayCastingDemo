class Segment
{
  PVector ini;
  PVector end;
  int hg = 300;
  Segment()
  {
    ini = PVector.random2D();
    ini.x = abs(ini.x);
    ini.y = abs(ini.y);
    ini.setMag((int)random(100,hg));
    end = PVector.random2D();
    end.x = abs(end.x);
    end.y = abs(end.y);
    end.setMag((int)random(100,hg));
  }
  
}
