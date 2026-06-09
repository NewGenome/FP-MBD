-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-05-26 00:55:42.328

-- tables
-- Table: Detail_Tindakan
CREATE TABLE Detail_Tindakan (
    Rekam_Medis_ID_Rekam_Medis varchar(15)  NOT NULL,
    Tindakan_Medis_ID_Tindakan Varchar(10)  NOT NULL,
    Jumlah_Tindakan int  NOT NULL,
    Keterangan text  NULL,
    CONSTRAINT Rekam_Medis_Tindakan_Medis_pk PRIMARY KEY (Rekam_Medis_ID_Rekam_Medis,Tindakan_Medis_ID_Tindakan)
);

-- Table: Dokter
CREATE TABLE Dokter (
    ID_Dokter varchar(10)  NOT NULL,
    Nama_Dokter varchar(100)  NOT NULL,
    Spesialisasi varchar(50)  NOT NULL,
    Tarif_Konsultasi decimal(10,0)  NOT NULL,
    CONSTRAINT Dokter_pk PRIMARY KEY (ID_Dokter)
);

-- Table: Invoice
CREATE TABLE Invoice (
    ID_Invoice varchar(15)  NOT NULL,
    Total_Tagihan decimal(12,0)  NOT NULL,
    Metode_Pembayaran varchar(20)  NOT NULL,
    Status_Pembayaran varchar(20)  NOT NULL,
    Waktu_Bayar datetime  NULL, 
    Rekam_Medis_ID_Rekam_Medis varchar(15)  NOT NULL,
    Pegawai_ID_Pegawai varchar(10)  NOT NULL,
    CONSTRAINT Invoice_pk PRIMARY KEY (ID_Invoice)
);

-- Table: Pasien
CREATE TABLE Pasien (
    ID_Pasien varchar(10)  NOT NULL,
    Nama_Pasien varchar(100)  NOT NULL,
    Tanggal_Lahir date  NOT NULL,
    Jenis_Kelamin char(1)  NOT NULL,
    Alamat varchar(255)  NOT NULL,
    No_Telepon varchar(15)  NOT NULL,
    CONSTRAINT Pasien_pk PRIMARY KEY (ID_Pasien)
);

-- Table: Pegawai
CREATE TABLE Pegawai (
    ID_Pegawai varchar(10)  NOT NULL,
    Nama_Pegawai varchar(100)  NOT NULL,
    Jabatan varchar(50)  NOT NULL,
    CONSTRAINT Pegawai_pk PRIMARY KEY (ID_Pegawai)
);

-- Table: Pendaftaran
CREATE TABLE Pendaftaran (
    ID_Kunjungan varchar(15)  NOT NULL,
    Tanggal_Kunjungan date  NOT NULL,
    Waktu_Daftar time  NOT NULL,
    Keluhan_Awal varchar(255)  NOT NULL,
    Nomor_Urut_Antrean int  NOT NULL,
    Status_Antrean varchar(20)  NOT NULL,
    Pasien_ID_Pasien varchar(10)  NOT NULL,
    Dokter_ID_Dokter varchar(10)  NOT NULL,
    Rekam_Medis_ID_Rekam_Medis varchar(15)  NULL, 
    Pegawai_ID_Pegawai Varchar(10)  NOT NULL,
    CONSTRAINT Pendaftaran_pk PRIMARY KEY (ID_Kunjungan)
);

-- Table: Rekam_Medis
CREATE TABLE Rekam_Medis (
    ID_Rekam_Medis varchar(15)  NOT NULL,
    Hasil_Pemeriksaan text  NOT NULL,
    Diagnosa varchar(150)  NOT NULL,
    Status_Kondisi varchar(20)  NOT NULL,
    Catatan_Resep_Obat text  NULL,
    Keterangan_Surat_Rujuk text  NULL,
    CONSTRAINT Rekam_Medis_pk PRIMARY KEY (ID_Rekam_Medis)
);

-- Table: Tindakan_Medis
CREATE TABLE Tindakan_Medis (
    ID_Tindakan varchar(10)  NOT NULL,
    Nama_Tindakan varchar(100)  NOT NULL,
    Tarif_Tindakan decimal(10,0)  NOT NULL,
    CONSTRAINT Tindakan_Medis_pk PRIMARY KEY (ID_Tindakan)
);

-- foreign keys
-- Reference: Invoice_Pegawai (table: Invoice)
ALTER TABLE Invoice ADD CONSTRAINT Invoice_Pegawai FOREIGN KEY Invoice_Pegawai (Pegawai_ID_Pegawai)
    REFERENCES Pegawai (ID_Pegawai);

-- Reference: Invoice_Rekam_Medis (table: Invoice)
ALTER TABLE Invoice ADD CONSTRAINT Invoice_Rekam_Medis FOREIGN KEY Invoice_Rekam_Medis (Rekam_Medis_ID_Rekam_Medis)
    REFERENCES Rekam_Medis (ID_Rekam_Medis);

-- Reference: Pendaftaran_Dokter (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Dokter FOREIGN KEY Pendaftaran_Dokter (Dokter_ID_Dokter)
    REFERENCES Dokter (ID_Dokter);

-- Reference: Pendaftaran_Pasien (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Pasien FOREIGN KEY Pendaftaran_Pasien (Pasien_ID_Pasien)
    REFERENCES Pasien (ID_Pasien);

-- Reference: Pendaftaran_Pegawai (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Pegawai FOREIGN KEY Pendaftaran_Pegawai (Pegawai_ID_Pegawai)
    REFERENCES Pegawai (ID_Pegawai);

-- Reference: Pendaftaran_Rekam_Medis (table: Pendaftaran)
ALTER TABLE Pendaftaran ADD CONSTRAINT Pendaftaran_Rekam_Medis FOREIGN KEY Pendaftaran_Rekam_Medis (Rekam_Medis_ID_Rekam_Medis)
    REFERENCES Rekam_Medis (ID_Rekam_Medis);

-- Reference: Rekam_Medis_Tindakan_Medis_Rekam_Medis (table: Detail_Tindakan)
ALTER TABLE Detail_Tindakan ADD CONSTRAINT Rekam_Medis_Tindakan_Medis_Rekam_Medis FOREIGN KEY Rekam_Medis_Tindakan_Medis_Rekam_Medis (Rekam_Medis_ID_Rekam_Medis)
    REFERENCES Rekam_Medis (ID_Rekam_Medis);

-- Reference: Rekam_Medis_Tindakan_Medis_Tindakan_Medis (table: Detail_Tindakan)
ALTER TABLE Detail_Tindakan ADD CONSTRAINT Rekam_Medis_Tindakan_Medis_Tindakan_Medis FOREIGN KEY Rekam_Medis_Tindakan_Medis_Tindakan_Medis (Tindakan_Medis_ID_Tindakan)
    REFERENCES Tindakan_Medis (ID_Tindakan);

-- End of file.

