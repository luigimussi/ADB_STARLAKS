SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Preferenza] (
		[Id_Preferenza]                [int] IDENTITY(1, 1) NOT NULL,
		[DecimaliQta]                  [tinyint] NOT NULL,
		[DecimaliQtaDB]                [tinyint] NOT NULL,
		[PicNorQta]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[PicNorQtaDB]                  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[PicSepQta]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[PicSepQtaDB]                  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Ean13]                        [varchar](9) COLLATE Latin1_General_CI_AS NULL,
		[OLContactEnabled]             [bit] NOT NULL,
		[OLContactFolder]              [varchar](255) COLLATE Latin1_General_CI_AS NULL,
		[MLSottoScortaEnabled]         [bit] NOT NULL,
		[MLSottoScortaRecipient]       [varchar](255) COLLATE Latin1_General_CI_AS NULL,
		[MLSottoScortaSubject]         [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[MLSottoScortaText]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[SCGiornoFisso1]               [tinyint] NOT NULL,
		[SCGiornoFisso2]               [tinyint] NOT NULL,
		[SCGiornoFisso3]               [tinyint] NOT NULL,
		[CGScRicrea]                   [bit] NOT NULL,
		[CGScUIModifica]               [bit] NOT NULL,
		[CGLinkRicrea]                 [bit] NOT NULL,
		[CGLinkUiModifica]             [bit] NOT NULL,
		[CGLinkProcessMode]            [tinyint] NOT NULL,
		[CGLinkStartMode]              [tinyint] NOT NULL,
		[CGIntraRicrea]                [bit] NOT NULL,
		[CGIntraUIModifica]            [bit] NOT NULL,
		[CGCSRicrea]                   [bit] NOT NULL,
		[CGCSUiModifica]               [bit] NOT NULL,
		[CGCSStartMode]                [tinyint] NOT NULL,
		[CGRARicrea]                   [bit] NOT NULL,
		[CGRAUiModifica]               [bit] NOT NULL,
		[CGRAStartMode]                [tinyint] NOT NULL,
		[CGRACondominio]               [numeric](5, 2) NOT NULL,
		[CGCorrispondenzaIvaMerce]     [bit] NOT NULL,
		[DOLinkRicrea]                 [bit] NOT NULL,
		[DOLinkUIModifica]             [bit] NOT NULL,
		[DOLinkStartMode]              [tinyint] NOT NULL,
		[DOIntraUIModifica]            [bit] NOT NULL,
		[DOIntraRicrea]                [bit] NOT NULL,
		[DOScUIModifica]               [bit] NOT NULL,
		[DOScRicrea]                   [bit] NOT NULL,
		[DOPrezziPerQta]               [smallint] NOT NULL,
		[DOAbilitaTipoPC]              [bit] NOT NULL,
		[DOAutoContratto]              [bit] NOT NULL,
		[Imp_DOEsente_Spese]           [numeric](18, 2) NOT NULL,
		[Imp_DOEsente_Limite]          [numeric](18, 2) NOT NULL,
		[Imp_DOEsente_Descrizione]     [varchar](50) COLLATE Latin1_General_CI_AS NULL,
		[Imp_DOEsente_ApplicaNC]       [bit] NOT NULL,
		[BlsOptions]                   [int] NOT NULL,
		[OS_Enabled]                   [bit] NOT NULL,
		[Intra_Cd_IntraErogazione]     [char](1) COLLATE Latin1_General_CI_AS NULL,
		[Intra_Cd_IntraIncasso]        [char](1) COLLATE Latin1_General_CI_AS NULL,
		[DB_CicliFasi]                 [bit] NOT NULL,
		[MPType]                       [tinyint] NOT NULL,
		[SP_Enabled]                   [bit] NOT NULL,
		[UserIns]                      [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                      [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                      [smalldatetime] NOT NULL,
		[TimeUpd]                      [smalldatetime] NOT NULL,
		[Ts]                           [timestamp] NULL,
		[CGContoUsePict]               [bit] NOT NULL,
		[DOMenu_Mode]                  [tinyint] NOT NULL,
		[CFEsposizione_Flag]           [smallint] NOT NULL,
		[Promozioni]                   [int] NOT NULL,
		[Comp2Pro_Report]              [bit] NOT NULL,
		[DOAliquotaSpese]              [bit] NOT NULL,
		[DMS_DefaultDir]               [varchar](200) COLLATE Latin1_General_CI_AS NULL,
		[xFtpHost]                     [varchar](128) COLLATE Latin1_General_CI_AS NULL,
		[xFtpPort]                     [tinyint] NULL,
		[xFtpUser]                     [varchar](64) COLLATE Latin1_General_CI_AS NULL,
		[xFtpPass]                     [varchar](64) COLLATE Latin1_General_CI_AS NULL,
		[xFtpOut]                      [varchar](64) COLLATE Latin1_General_CI_AS NULL,
		[xFtpPDF]                      [bit] NOT NULL,
		[Intra_NoInfoServizi]          [bit] NOT NULL,
		[DOIgnoraCommessa]             [bit] NOT NULL,
		CONSTRAINT [PK_Preferenza]
		PRIMARY KEY
		CLUSTERED
		([Id_Preferenza])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_DecimaliQta]
	CHECK
	([DecimaliQta]<=(8))
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_DecimaliQta]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_DecimaliQtaDB]
	CHECK
	NOT FOR REPLICATION
	([DecimaliQtaDB]>=(0) AND [DecimaliQtaDB]<=(7))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900361 | DecimaliQtaDB', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'CONSTRAINT', N'CK_Preferenza_DecimaliQtaDB'
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_DecimaliQtaDB]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_DOMenu_Mode]
	CHECK
	([DOMenu_Mode]>=(0) AND [DOMenu_Mode]<=(2))
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_DOMenu_Mode]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_DOPrezziPerQta]
	CHECK
	([DOPrezziPerQta]=(3) OR ([DOPrezziPerQta]=(2) OR [DOPrezziPerQta]=(1)))
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_DOPrezziPerQta]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_Ean13_1]
	CHECK
	([Ean13] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR [Ean13] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_Ean13_1]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_Intra_Cd_IntraErogazione]
	CHECK
	([Intra_Cd_IntraErogazione] IS NULL OR ([Intra_Cd_IntraErogazione]='R' OR [Intra_Cd_IntraErogazione]='I'))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900693', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'CONSTRAINT', N'CK_Preferenza_Intra_Cd_IntraErogazione'
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_Intra_Cd_IntraErogazione]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_Intra_Cd_IntraIncasso]
	CHECK
	([Intra_Cd_IntraIncasso] IS NULL OR ([Intra_Cd_IntraIncasso]='X' OR [Intra_Cd_IntraIncasso]='B' OR [Intra_Cd_IntraIncasso]='A'))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900695', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'CONSTRAINT', N'CK_Preferenza_Intra_Cd_IntraIncasso'
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_Intra_Cd_IntraIncasso]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [CK_Preferenza_MPType]
	CHECK
	([MPType]=(3) OR [MPType]=(2) OR [MPType]=(1) OR [MPType]=(0))
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_MPType]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_SCGiornoFisso1]
	CHECK
	NOT FOR REPLICATION
	([SCGiornoFisso1]>=(0) AND [SCGiornoFisso1]<=(31))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | SCGiornoFisso1 | [0,31]', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'CONSTRAINT', N'CK_Preferenza_SCGiornoFisso1'
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_SCGiornoFisso1]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_SCGiornoFisso2]
	CHECK
	NOT FOR REPLICATION
	([SCGiornoFisso2]>=(0) AND [SCGiornoFisso2]<=(31))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | SCGiornoFisso2 | [0,31]', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'CONSTRAINT', N'CK_Preferenza_SCGiornoFisso2'
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_SCGiornoFisso2]
GO
ALTER TABLE [dbo].[Preferenza]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_Preferenza_SCGiornoFisso3]
	CHECK
	NOT FOR REPLICATION
	([SCGiornoFisso3]>=(0) AND [SCGiornoFisso3]<=(31))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | SCGiornoFisso3 | [0,31]', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'CONSTRAINT', N'CK_Preferenza_SCGiornoFisso3'
GO
ALTER TABLE [dbo].[Preferenza]
CHECK CONSTRAINT [CK_Preferenza_SCGiornoFisso3]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_BlsOptions]
	DEFAULT ((0)) FOR [BlsOptions]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CFEsposizione_Flag]
	DEFAULT ((0)) FOR [CFEsposizione_Flag]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGContoUsePict]
	DEFAULT ((0)) FOR [CGContoUsePict]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGCorrispondenzaIvaMerce]
	DEFAULT ((0)) FOR [CGCorrispondenzaIvaMerce]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGCSRicrea]
	DEFAULT ((0)) FOR [CGCSRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGCSStartMode]
	DEFAULT ((1)) FOR [CGCSStartMode]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGCSUiModifica]
	DEFAULT ((0)) FOR [CGCSUiModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGIntraRicrea]
	DEFAULT ((0)) FOR [CGIntraRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGIntraUIModifica]
	DEFAULT ((0)) FOR [CGIntraUIModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGLinkProcessMode]
	DEFAULT ((1)) FOR [CGLinkProcessMode]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGLinkRicrea]
	DEFAULT ((0)) FOR [CGLinkRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGLinkStartMode]
	DEFAULT ((1)) FOR [CGLinkStartMode]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGLinkUIModifica]
	DEFAULT ((1)) FOR [CGLinkUiModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGRARicrea]
	DEFAULT ((0)) FOR [CGRARicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGRAStartMode]
	DEFAULT ((1)) FOR [CGRAStartMode]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGRAUiModifica]
	DEFAULT ((0)) FOR [CGRAUiModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGScRicrea]
	DEFAULT ((0)) FOR [CGScRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_CGScUIModifica]
	DEFAULT ((1)) FOR [CGScUIModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Comp2Pro_Report]
	DEFAULT ((0)) FOR [Comp2Pro_Report]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Condominio]
	DEFAULT ((4)) FOR [CGRACondominio]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DB_CicliFasi]
	DEFAULT ((0)) FOR [DB_CicliFasi]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DecimaliQta]
	DEFAULT ((2)) FOR [DecimaliQta]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DecimaliQtaDB]
	DEFAULT ((2)) FOR [DecimaliQtaDB]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOAbilitaTipoPC]
	DEFAULT ((0)) FOR [DOAbilitaTipoPC]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOAliquotaSpese]
	DEFAULT ((0)) FOR [DOAliquotaSpese]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOAutoContratto]
	DEFAULT ((0)) FOR [DOAutoContratto]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOIgnoraCommessa]
	DEFAULT ((0)) FOR [DOIgnoraCommessa]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DoIntraRicrea]
	DEFAULT ((0)) FOR [DOIntraRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOIntraUIModifica]
	DEFAULT ((0)) FOR [DOIntraUIModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOLinkRicrea]
	DEFAULT ((0)) FOR [DOLinkRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOLinkStartMode]
	DEFAULT ((1)) FOR [DOLinkStartMode]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOLinkUIModifica]
	DEFAULT ((0)) FOR [DOLinkUIModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOMenu_Mode]
	DEFAULT ((2)) FOR [DOMenu_Mode]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOPrezziPerQta]
	DEFAULT ((1)) FOR [DOPrezziPerQta]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOScRicrea]
	DEFAULT ((1)) FOR [DOScRicrea]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_DOScUIModifica]
	DEFAULT ((0)) FOR [DOScUIModifica]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Ean13]
	DEFAULT ('1234567') FOR [Ean13]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Imp_DOEsente_ApplicaNC]
	DEFAULT ((0)) FOR [Imp_DOEsente_ApplicaNC]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Imp_DoEsente_Limite]
	DEFAULT ((0)) FOR [Imp_DOEsente_Limite]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Imp_DoEsente_Spese]
	DEFAULT ((0)) FOR [Imp_DOEsente_Spese]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Intra_NoInfoServizi]
	DEFAULT ((0)) FOR [Intra_NoInfoServizi]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_MLSottoScortaEnabled]
	DEFAULT ((0)) FOR [MLSottoScortaEnabled]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_MLSottoScortaSubject]
	DEFAULT ('Articolo sotto scorta') FOR [MLSottoScortaSubject]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_MPType]
	DEFAULT ((0)) FOR [MPType]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_OLConcactEnabled]
	DEFAULT ((0)) FOR [OLContactEnabled]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_OS_Enabled]
	DEFAULT ((0)) FOR [OS_Enabled]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_Promozioni]
	DEFAULT ((0)) FOR [Promozioni]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_SCGiornoFisso1]
	DEFAULT ((0)) FOR [SCGiornoFisso1]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_SCGiornoFisso2]
	DEFAULT ((0)) FOR [SCGiornoFisso2]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_SCGiornoFisso3]
	DEFAULT ((0)) FOR [SCGiornoFisso3]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_SP_Enabled]
	DEFAULT ((0)) FOR [SP_Enabled]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_xFtpHost]
	DEFAULT (NULL) FOR [xFtpHost]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_xFtpOut]
	DEFAULT (NULL) FOR [xFtpOut]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_xFtpPass]
	DEFAULT (NULL) FOR [xFtpPass]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_xFtpPDF]
	DEFAULT ((0)) FOR [xFtpPDF]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_xFtpPort]
	DEFAULT (NULL) FOR [xFtpPort]
GO
ALTER TABLE [dbo].[Preferenza]
	ADD
	CONSTRAINT [DF_Preferenza_xFtpUser]
	DEFAULT (NULL) FOR [xFtpUser]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indica se i movimenti contabili collegati vengono presentati tutti insieme o consecutivamente uno alla volta.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'CGLinkProcessMode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indica se devono forzatamente essere ricreati i movimenti contabili collegati ogni volta che viene modificato un movimento contabile.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'CGLinkRicrea'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nel caso i movimenti contabili collegati fossero visualizzati consecutivamente (CGLinkProcessMode = 1) decide se partire in modalità show o edit.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'CGLinkStartMode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indica se dopo la conferma del movimento contabile devono essere presentati al client i movimenti contabili collegati.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'CGLinkUiModifica'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Indica se devono forzatamente essere ricreate le scadenze ogni volta che viene modificato un movimento contabile.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'CGScRicrea'
GO
EXEC sp_addextendedproperty N'MS_Description', N'indica se dopo la conferma del movimento contabile devono esere presentate al client le scadenze generate.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'CGScUIModifica'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero di decimali per le quantità!', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'DecimaliQta'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero di decimali per le quantità in distinta base!', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'DecimaliQtaDB'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Parte iniziale fissa per i codici EAN13 (80 Italia + 5 caratteri numerici codice produttore da chidere all''indicod di Milano.', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'Ean13'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Picture per le quantità!', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'PicNorQta'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Picture per le quantità in distinta base', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'PicNorQtaDB'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Picture per le quantità con separatori di migliaia!', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'PicSepQta'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Picture per le quantità in distinta base con separatori di migliaia!', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'PicSepQtaDB'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Host Ftp dove scaricare i file per Stef', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'xFtpHost'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Cartella dove scaricare i file per Stef', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'xFtpOut'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Password Ftp', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'xFtpPass'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Forza l''invio dei PDF all''FTP', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'xFtpPDF'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Porta Ftp dove scaricare i file per Stef', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'xFtpPort'
GO
EXEC sp_addextendedproperty N'MS_Description', N'User Ftp', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', 'COLUMN', N'xFtpUser'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900610', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Preferenze ed impostazioni varie', 'SCHEMA', N'dbo', 'TABLE', N'Preferenza', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[Preferenza]
	TO [public]
GO
ALTER TABLE [dbo].[Preferenza] SET (LOCK_ESCALATION = TABLE)
GO
